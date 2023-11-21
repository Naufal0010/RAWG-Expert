//
//  DetailView.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 16/11/23.
//

import SwiftUI
import CachedAsyncImage

struct DetailView: View {
    @ObservedObject var presenter: DetailPresenter
    
    var body: some View {
        ZStack {
            if presenter.isLoading {
                loadingIndicator
            } else {
                ScrollView(.vertical) {
                    VStack {
                        imageCategory
                        spacer
                        content
                        spacer
                    }.padding()
                }
            }
        }.navigationBarTitle(
            Text(self.presenter.data.name),
            displayMode: .large)
        .onAppear {
            self.presenter.getDetailGame()
        }
    }
}

extension DetailView {
    var spacer: some View {
        Spacer()
    }
    
    var loadingIndicator: some View {
        VStack {
            Text("Loading...")
            ProgressView()
        }
    }
    
    var imageCategory: some View {
        CachedAsyncImage(url: URL(string: self.presenter.data.urlBackground)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }.scaledToFit().frame(width: 250.0, height: 250.0, alignment: .center)
    }
    
    var released: some View {
        Text(self.presenter.data.released)
            .font(.system(size: 15))
    }
    
    var descriptionGames: some View {
        Text(self.presenter.data.desc)
            .font(.system(size: 15))
    }
    
    func headerTitle(_ title: String) -> some View {
        return Text(title)
            .font(.headline)
    }
    
    var content: some View {
        VStack(alignment: .leading, spacing: 0) {
            headerTitle("Released")
                .padding([.top, .bottom])
            released
            descriptionGames
        }
    }
}
