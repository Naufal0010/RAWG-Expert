//
//  SearchInteractor.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 22/11/23.
//

import Foundation
import Combine

protocol SearchUseCase  {
    
    func searchGame(by name: String) -> AnyPublisher<[GameModel], Error>
    
}

class SearchInteractor: SearchUseCase {
    
    private let repository: RawgRepositoryProtocol
    
    required init(repository: RawgRepositoryProtocol) {
        self.repository = repository
    }
    
    func searchGame(by name: String) -> AnyPublisher<[GameModel], Error> {
        return repository.searchGame(by: name)
    }
}
