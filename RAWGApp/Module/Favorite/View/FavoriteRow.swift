//
//  FavoriteRow.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 23/11/23.
//

import SwiftUI
import CachedAsyncImage

struct FavoriteRow: View {
    var gameModel: GameModel
    
    var body: some View {
        HStack {
            CachedAsyncImage(url: URL(string: gameModel.urlBackground )) { image in
                image
                    .resizable()
                    .frame(width: 120, height: 120)
                    .cornerRadius(10)
                    .scaledToFill()
            } placeholder: {
                ProgressView("")
                    .progressViewStyle(CircularProgressViewStyle())
                    .tint(.gray)
                    .frame(width: 120, height: 120)
            }
            
            
            VStack(alignment: .leading) {
                Text(gameModel.name)
                    .bold()
                    .font(.system(size: 16))
                    .foregroundColor(Color.white)
                
                Text("Rating: \(gameModel.rating, specifier: "%.2f")")
                    .font(.system(.caption))
                    .foregroundStyle(.white)
                    .fontWeight(.thin)
                    .multilineTextAlignment(.leading)
                
                Text("Release Date: \(gameModel.released )")
                    .font(.system(.caption))
                    .foregroundStyle(.white)
                    .fontWeight(.thin)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
        }
        .background(Color.grayItem)
        .cornerRadius(10)
    }
}

#Preview {
    FavoriteRow(gameModel: GameModel(
        id: 3498,
        name: "Grand Theft Auto V",
        released: "2013-09-17",
        desc: "",
        urlBackground: "https://media.rawg.io/media/games/20a/20aa03a10cda45239fe22d035c0ebe64.jpg",
        rating: 4.47,
        metacritic: 94)
    )
}
