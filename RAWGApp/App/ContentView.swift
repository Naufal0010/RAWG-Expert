//
//  ContentView.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 09/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    
    var body: some View {
        ZStack {
            if showSplash {
                SplashView()
                    .transition(.opacity)
                    .animation(.easeOut(duration: 1.5), value: showSplash)
            } else {
                OnBoardingSlide()
            }
        }
        .onAppear {
            DispatchQueue.main
                .asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.showSplash = false
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
