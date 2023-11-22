//
//  HomePresenter.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 14/11/23.
//

import SwiftUI
import Combine

class HomePresenter: ObservableObject {
    
    private let router = HomeRouter()
    private let homeUseCase: HomeUseCase
    private let searchUseCase: SearchUseCase
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var rawgs: [GameModel] = []
    @Published var errorMessage: String = ""
    @Published var isLoading: Bool = false
    
    @Published var searchText: String = ""
    
    init(homeUseCase: HomeUseCase, searchUseCase: SearchUseCase) {
        self.homeUseCase = homeUseCase
        self.searchUseCase = searchUseCase
    }
    
    func getAllGames() {
        isLoading = true
        homeUseCase.getAllGames()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    self.errorMessage = String(describing: completion)
                    debugPrint(self.errorMessage)
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: { rawgs in
                self.rawgs = rawgs
            })
            .store(in: &cancellables)
    }
    
    func searchGame() {
        isLoading = true
        searchUseCase.searchGame(by: searchText)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: { games in
                self.rawgs = []
                self.rawgs = games
                debugPrint(games)
            })
            .store(in: &cancellables)
    }
    
    func linkBuilder<Content: View>(
        for game: GameModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(destination: router.makeDetailView(for: game)) { content() }
    }
}
