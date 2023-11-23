//
//  FavoritePresenter.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 23/11/23.
//

import SwiftUI
import Combine

class FavoritePresenter: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    private let router = FavoriteRouter()
    private let favoriteUseCase: FavoriteUseCase
    
    @Published var games: [GameModel] = []
    @Published var errorMessage: String = ""
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
    
    init(favoriteUseCase: FavoriteUseCase) {
        self.favoriteUseCase = favoriteUseCase
    }
    
    func getFavoriteGames() {
        isLoading = true
        favoriteUseCase.getFavoriteGames()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.isLoading = false
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    self.isError = true
                }
            }, receiveValue: { favorites in
                self.games = favorites
            })
            .store(in: &cancellables)
    }
    
    func linkBuilder<Content: View>(
        for game: GameModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(destination: router.makeMealView(for: game)) { content() }
    }
}
