//
//  ProfileVIew.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 21/11/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color(.bg)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("ProfilePhoto")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 180, height: 180)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 2)
                    }
                    .shadow(radius: 5)
                    .offset(y: -150)
                    .padding(.bottom, -130)
                
                Text("Naufal Abiyyu Mayusuf")
                    .font(.headline)
                    .foregroundStyle(.white)
            
                Text("naufal1068@\u{200C}gmail.com")
                    .font(.system(.caption))
                    .padding(.top, 0.5)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    ProfileView()
}
