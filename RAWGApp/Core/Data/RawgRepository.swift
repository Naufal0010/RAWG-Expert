//
//  RawgRepository.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 13/11/23.
//

import Foundation
import Combine

protocol RawgRepositoryProtocol {
    
    func getAllGames() -> AnyPublisher<[GameModel], Error>
    func getDetailGame(by id: Int) -> AnyPublisher<GameModel, Error>
    func searchGame(by name: String) -> AnyPublisher<[GameModel], Error>
    
}

final class RawgRepository: NSObject {
    
    typealias GameInstance = (LocaleDataSource, RemoteDataSource) -> RawgRepository
    
    fileprivate let remote: RemoteDataSource
    fileprivate let locale: LocaleDataSource
    
    private init(locale: LocaleDataSource, remote: RemoteDataSource) {
        self.locale = locale
        self.remote = remote
    }
    
    static let sharedInstance: GameInstance = { localeRepo, remoteRepo in
        return RawgRepository(locale: localeRepo, remote: remoteRepo)
    }
}

extension RawgRepository: RawgRepositoryProtocol {
    
    func getAllGames() -> AnyPublisher<[GameModel], Error> {
        return self.locale.getAllGames()
            .flatMap { result -> AnyPublisher<[GameModel], Error> in
                if result.isEmpty {
                    return self.remote.getAllGames()
                        .map { RawgMapper.mapRawgResponsesToEntities(input: $0) }
                        .flatMap { self.locale.addGames(from: $0) }
                        .filter { $0 }
                        .flatMap { _ in self.locale.getAllGames()
                                .map { RawgMapper.mapRawgEntitiesToDomains(input: $0)}
                        }
                        .eraseToAnyPublisher()
                } else {
                    return self.locale.getAllGames()
                        .map { RawgMapper.mapRawgEntitiesToDomains(input: $0) }
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
    
    func getDetailGame(by id: Int) -> AnyPublisher<GameModel, Error> {
        return self.locale.getDetailGame(by: id)
            .flatMap { result -> AnyPublisher<GameModel, Error> in
                if result.descriptionGames == "" {
                    return self.remote.getDetailGames(by: id)
                        .map { RawgMapper.mapDetailResponsesToEntity(by: id, input: $0) }
                        .catch { _ in self.locale.getDetailGame(by: id) }
                        .flatMap { self.locale.updateGame(by: id, detail: $0) }
                        .filter { $0 }
                        .flatMap { _ in self.locale.getDetailGame(by: id)
                                .map { RawgMapper.mapDetailDetailEntityToDomain(input: $0) }
                        }.eraseToAnyPublisher()
                } else {
                    return self.locale.getDetailGame(by: id)
                        .map { RawgMapper.mapDetailDetailEntityToDomain(input: $0) }
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
    
    func searchGame(by name: String) -> AnyPublisher<[GameModel], Error> {
        return self.remote.searchGame(by: name)
            .map { RawgMapper.mapDetailGameResponseToEntity(input: $0) }
            .catch { _ in self.locale.getGamesBy(name) }
            .flatMap { responses in
                self.locale.getGamesBy(name)
                    .flatMap { locale -> AnyPublisher<[GameModel], Error> in
                        if responses.count > locale.count {
                            return self.locale.addGamesBy(name, from: responses)
                                .filter { $0 }
                                .flatMap { _ in self.locale.getGamesBy(name)
                                        .map { RawgMapper.mapRawgEntitiesToDomains(input: $0)}
                                }.eraseToAnyPublisher()
                        } else {
                            return self.locale.getGamesBy(name)
                                .map { RawgMapper.mapRawgEntitiesToDomains(input: $0) }
                                .eraseToAnyPublisher()
                        }
                    }
            }.eraseToAnyPublisher()
    }
    
}
