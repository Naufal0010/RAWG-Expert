//
//  DetailView.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 16/11/23.
//

import SwiftUI
import CachedAsyncImage
import RichText

struct DetailView: View {
    @ObservedObject var presenter: DetailPresenter
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                        CachedAsyncImage(url: URL(string: self.presenter.data.urlBackground)) { image in
                            image
                                .resizable()
                                .aspectRatio(3 / 2, contentMode: .fit)
                        } placeholder: {
                            ProgressView("")
                                .progressViewStyle(CircularProgressViewStyle())
                                .tint(.gray)
                                .frame(width: 120, height: 120)
                        }
                        
                        VStack(alignment: .leading) {
                            
                            Text(self.presenter.data.name)
                                .fontWeight(.bold)
                                .font(.system(size: 24))
                                .foregroundStyle(.white)
                                .padding(.bottom, 12)
                            
                            HStack(alignment: .top ,spacing: 36) {
                                
                                VStack(alignment: .leading) {
                                    Text("Release Date")
                                        .font(.system(size: 14))
                                        .foregroundStyle(.white)
                                    
                                    Text(self.presenter.data.released)
                                        .font(.system(.caption))
                                        .foregroundStyle(.gray100)
                                        .fontWeight(.thin)
                                        .multilineTextAlignment(.leading)
                                }
                                
                                
                                VStack(alignment: .leading) {
                                    Text("Metacritic")
                                        .font(.system(size: 14))
                                        .foregroundStyle(.white)
                                    
                                    Text("\(self.presenter.data.metacritic)")
                                        .font(.system(.caption))
                                        .foregroundStyle(.gray100)
                                        .fontWeight(.thin)
                                        .multilineTextAlignment(.leading)
                                }
                                
                                VStack(alignment: .leading) {
                                    Text("Rating")
                                        .font(.system(size: 14))
                                        .foregroundStyle(.white)
                                    
                                    Text("\(self.presenter.data.rating, specifier: "%.2f")")
                                        .font(.system(.caption))
                                        .foregroundStyle(.gray100)
                                        .fontWeight(.thin)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                            
                            Spacer()
                            
                        }
                        .padding(16)
                        
                        VStack(alignment: .leading) {
                            
                            Divider()
                                .background(.white)
                            
                            Text("About")
                                .font(.system(.title2))
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                            
                            if presenter.isLoading {
                                VStack {
                                    ForEach(0..<5, id: \.self) { _ in
                                        ShimmerTextView()
                                    }
                                }
                            } else {
                                RichText(html: self.presenter.data.desc)
                                    .foregroundColor(light: Color.white, dark: Color.white)
                                    .font(.system(size: 12))
                            }
                            
                        }
                        .padding(.horizontal, 16)
                        
                        Spacer()
                    }
                    
            }
            .background(Color.bg)
        }
        .tint(Color.accentColor)
        .onAppear {
            self.presenter.getDetailGame()
        }
    }
}
