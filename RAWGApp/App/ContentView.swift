//
//  ContentView.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 09/11/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var homePresenter: HomePresenter
    
    var body: some View {
        NavigationStack {
            HomeView(presenter: homePresenter)
        }
    }
}

#Preview {
    ContentView()
}
