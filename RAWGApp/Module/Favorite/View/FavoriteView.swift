//
//  FavoriteView.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 23/11/23.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var presenter: FavoritePresenter
    
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading) {
                
                Text("Favorite Games")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                
                ScrollView(.vertical, showsIndicators: false) {
                    if presenter.isLoading {
                        VStack {
                            ForEach(0..<5, id: \.self) { _ in
                                ShimmerView()
                            }
                        }
                    } else {
                        if presenter.games.count == 0 {
                            EmptyView(selectedView: .favorite)
                        } else {
                            ForEach(self.presenter.games, id: \.id) { game in
                                ZStack {
                                    self.presenter.linkBuilder(for: game) {
                                        FavoriteRow(gameModel: game)
                                    }.buttonStyle(PlainButtonStyle())
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .background(Color.bg)
        .onAppear {
            self.presenter.getFavoriteGames()
        }
    }
}

