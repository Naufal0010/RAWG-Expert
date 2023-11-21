//
//  SplashView.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 21/11/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color(.bg)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("RAWG")
                    .font(.system(size: 48))
                    .fontWeight(.heavy)
                    .tracking(8)
                    .foregroundStyle(.white)
                
                Text("The biggest video game database")
                    .font(.system(size: 12))
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    SplashView()
}
