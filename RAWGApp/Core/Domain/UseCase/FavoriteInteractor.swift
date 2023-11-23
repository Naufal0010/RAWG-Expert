//
//  File.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 23/11/23.
//

import Foundation
import Combine

protocol FavoriteUseCase {
    
    func getFavoriteGames() -> AnyPublisher<[GameModel], Error>
    
}

class FavoriteInteractor: FavoriteUseCase {
    
    private let repository: RawgRepositoryProtocol
    
    required init(repository: RawgRepositoryProtocol) {
        self.repository = repository
    }
    
    func getFavoriteGames() -> AnyPublisher<[GameModel], Error> {
        return repository.getFavoriteGames()
    }
}
