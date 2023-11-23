//
//  HomeRouter.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 14/11/23.
//

import SwiftUI

class HomeRouter {
    
    func makeDetailView(for detail: GameModel) -> some View {
        let detailUseCase = Injection.init().provideDetail(detail: detail)
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        return DetailView(presenter: presenter)
    }
    
    func makeFavoriteView() -> some View {
        let favoriteUseCase = Injection.init().provideFavorite()
        let presenter = FavoritePresenter(favoriteUseCase: favoriteUseCase)
        return FavoriteView(presenter: presenter)
    }
}
