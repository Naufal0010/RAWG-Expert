//
//  HomeInteractor.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 14/11/23.
//

import Foundation
import Combine

protocol HomeUseCase {
    
    func getAllGames() -> AnyPublisher<[GameModel], Error>
    
}

class HomeInteractor: HomeUseCase {
    
    private let repository: RawgRepositoryProtocol
    
    required init(repository: RawgRepositoryProtocol) {
        self.repository = repository
    }
    
    func getAllGames() -> AnyPublisher<[GameModel], Error> {
        return repository.getAllGames()
    }
}
