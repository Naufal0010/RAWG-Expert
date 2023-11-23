//
//  DetailPresenter.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 16/11/23.
//

import Foundation
import Combine

class DetailPresenter: ObservableObject {
    
    private let detailUseCase: DetailUseCase
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var data: GameModel
    @Published var errorMessage: String = ""
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
    @Published var showingAlert: Bool = false
    
    init(detailUseCase: DetailUseCase) {
        self.detailUseCase = detailUseCase
        data = detailUseCase.getDetailGame()
    }
    
    func getDetailGame() {
        isLoading = true
        detailUseCase.getDetailGame()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isError = true
                    self.isLoading = false
                    debugPrint(error)
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: { detail in
                self.data.desc = detail.desc
//                debugPrint(detail)
            })
            .store(in: &cancellables)
    }
    
    func updateFavoriteGame() {
        detailUseCase.updateFavoriteGame()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.isLoading = false
                case .failure:
                    self.errorMessage = String(describing: completion)
                }
            }, receiveValue: { favorite in
                self.data = favorite
                debugPrint(favorite)
            })
            .store(in: &cancellables)
    }
}
