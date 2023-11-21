//
//  HomeHeader.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 16/11/23.
//

import SwiftUI

struct HomeHeader: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Explore the Gaming")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 24))
                    .bold()
                
                Text("Discover, Play and Conquer")
                    .foregroundStyle(Color.white)
                    .font(.caption)
                    .fontWeight(.thin)
            }
            
            Spacer()
            
//            NavigationLink(destination: ProfileView()) {
                Image("ProfilePhoto")
                    .resizable()
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                .foregroundColor(.black)
//            }
        }
    }
}

#Preview {
    HomeHeader()
}
