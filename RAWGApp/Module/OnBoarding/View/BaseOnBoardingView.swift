//
//  BaseOnBoardingView.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 15/11/23.
//

import SwiftUI

struct BaseOnBoardingView: View {
    var page: Page
    
    var body: some View {
        VStack(spacing: 20) {
            Image("\(page.imageUrl)")
                .resizable()
                .scaledToFit()
                .padding()
                .cornerRadius(30)
            
            Text(page.name)
                .font(.title)
                .foregroundStyle(Color.white)
                
            Text(page.description)
                .font(.subheadline)
                .frame(width: 300)
                .foregroundStyle(Color.white)
        }
    }
}

#Preview {
    BaseOnBoardingView(page: Page.onBoardingPage)
}
