//
//  EmptyView.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 16/11/23.
//

import SwiftUI

enum NameOfView {
    case home, favorite, noInternet
}

struct EmptyView: View {
    @State var selectedView: NameOfView
    
    var body: some View {
        VStack {
            switch selectedView {
            case .home:
                EmptyViewHome()
            case .favorite:
                EmptyViewFavorite()
            case .noInternet:
                NoInternetView()
            }
        }
    }
}

struct EmptyViewHome: View {
    var body: some View {
        VStack {
            Image(.empty)
                .resizable()
                .scaledToFit()
                .padding()
                .cornerRadius(30)
            
            Text("No results matched your search")
                .font(.caption)
                .foregroundStyle(.white)
        }
    }
}

struct EmptyViewFavorite: View {
    var body: some View {
        VStack {
            Image(.empty)
                .resizable()
                .scaledToFit()
                .padding()
                .cornerRadius(30)
            
            Text("No data of favorites games")
                .font(.caption)
                .foregroundStyle(.white)
        }
    }
}

struct NoInternetView: View {
    var body: some View {
        VStack {
            Image(.empty)
                .resizable()
                .scaledToFit()
                .padding()
                .cornerRadius(30)
            
            Text("Network connection seems to be offline.\nPlease check your connectivity.")
                .font(.caption)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    EmptyView(selectedView: .home)
}
