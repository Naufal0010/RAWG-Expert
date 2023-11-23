//
//  HomeView.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 15/11/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var presenter: HomePresenter
    @StateObject var networkMonitor = NetworkMonitor()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HomeHeader()
            
            HStack {
                SearchBar(searchText: self.$presenter.searchText)
                    .padding(.top, 8)
                    .onChange(of: self.presenter.searchText) {
                        if self.presenter.searchText.isEmpty {
                            self.presenter.getAllGames()
                        } else {
                            self.presenter.searchGame()
                        }
                    }
                
                self.presenter.linkBuilderFavorite {
                    Image(systemName: "heart.fill")
                        .padding()
                        .foregroundStyle(.gray800)
                        .background(.gray100)
                        .cornerRadius(10)
                }
            }
            
            Text("All Games")
                .font(.title)
                .fontWeight(.bold)
                .font(.system(size: 12))
                .foregroundStyle(.white)
                .padding(.top, 16)
            
            ScrollView(.vertical, showsIndicators: false) {
                if !networkMonitor.isConnected {
                    EmptyView(selectedView: .noInternet)
                } else {
                    if presenter.isLoading {
                        VStack {
                            ForEach(0..<5, id: \.self) { _ in
                                ShimmerView()
                            }
                        }
                    } else {
                        ForEach(self.presenter.rawgs, id: \.id) { game in
                            ZStack {
                                self.presenter.linkBuilder(for: game) {
                                    GameRow(gameModel: game)
                                }.buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color.bg)
        .onAppear {
            if self.presenter.rawgs.count == 0 {
                self.presenter.getAllGames()
            }
        }
    }
}
