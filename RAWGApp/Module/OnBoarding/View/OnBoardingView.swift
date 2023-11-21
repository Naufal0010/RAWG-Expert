//
//  OnBoardingView.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 21/11/23.
//

import SwiftUI

struct OnBoardingView: View {
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
    OnBoardingView(page: Page.onBoardingPage)
}
