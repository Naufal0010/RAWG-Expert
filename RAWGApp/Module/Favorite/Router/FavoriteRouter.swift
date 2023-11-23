//
//  FavoriteRouter.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 23/11/23.
//

import SwiftUI

class FavoriteRouter {
    
    func makeMealView(for game: GameModel) -> some View {
        let detailUseCase = Injection.init().provideDetail(detail: game)
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        return DetailView(presenter: presenter)
    }
}
