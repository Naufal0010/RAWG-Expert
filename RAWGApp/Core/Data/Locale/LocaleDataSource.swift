//
//  LocaleDataSource.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 13/11/23.
//

import Foundation
import RealmSwift
import Combine

protocol LocaleDataSourceProtocol: AnyObject {
    
    func getAllGames() -> AnyPublisher<[RawgEntity], Error>
    func addGames(from games: [RawgEntity]) -> AnyPublisher<Bool, Error>
    func getDetailGame(by idGame: Int) -> AnyPublisher<RawgEntity, Error>
    func updateGame(by idGame: Int, detail: RawgEntity) -> AnyPublisher<Bool, Error>
}

final class LocaleDataSource: NSObject {
    
    private let realm: Realm?
    
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> LocaleDataSource = { realmDatabase in
        return LocaleDataSource(realm: realmDatabase)
    }
}

extension LocaleDataSource: LocaleDataSourceProtocol {
    
    func getAllGames() -> AnyPublisher<[RawgEntity], Error> {
        return Future<[RawgEntity], Error> { completion in
            if let realm = self.realm {
                let games: Results<RawgEntity> = {
                    realm.objects(RawgEntity.self)
                        
                }()
                completion(.success(games.toArray(ofType: RawgEntity.self)))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func addGames(from games: [RawgEntity]) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm {
                do {
                    try realm.write {
                        for game in games {
                            realm.add(game, update: .all)
                        }
                        completion(.success(true))
                    }
                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func getDetailGame(by idGame: Int) -> AnyPublisher<RawgEntity, Error> {
        return Future<RawgEntity, Error> { completion in
            if let realm = self.realm {
                let details: Results<RawgEntity> = {
                    realm.objects(RawgEntity.self)
                        .filter("id == \(idGame)")
                }()
                
                guard let detail = details.first else {
                    completion(.failure(DatabaseError.requestFailed))
                    debugPrint(details)
                    return
                }
                
                completion(.success(detail))
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
    
    func updateGame(by idGame: Int, detail: RawgEntity) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
            if let realm = self.realm, let detailEntity = {
                realm.objects(RawgEntity.self).filter("id = \(idGame)")
            }().first {
                do {
                    try realm.write {

                        detailEntity.setValue(detail.descriptionGames, forKey: "descriptionGames")
                        detailEntity.setValue(detail.isFavorite, forKey: "isFavorite")
                    }
                    completion(.success(true))

                } catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
            } else {
                completion(.failure(DatabaseError.invalidInstance))
            }
        }.eraseToAnyPublisher()
    }
}

extension Results {
    
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0 ..< count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
}
