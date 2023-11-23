//
//  DetailInteractor.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 16/11/23.
//

import Foundation
import Combine

protocol DetailUseCase {
    
    func getDetailGame() -> GameModel
    func getDetailGame() -> AnyPublisher<GameModel, Error>
    func updateFavoriteGame() -> AnyPublisher<GameModel, Error>
}

class DetailInteractor: DetailUseCase {
    
    private let repository: RawgRepositoryProtocol
    private let detail: GameModel
    
    required init(repository: RawgRepositoryProtocol, detail: GameModel) {
        self.repository = repository
        self.detail = detail
    }
    
    func getDetailGame() -> GameModel {
        return detail
    }
    
    func getDetailGame() -> AnyPublisher<GameModel, Error> {
        return repository.getDetailGame(by: detail.id)
    }
    
    func updateFavoriteGame() -> AnyPublisher<GameModel, Error> {
        return repository.updateFavoriteGame(by: detail.id)
    }
}
