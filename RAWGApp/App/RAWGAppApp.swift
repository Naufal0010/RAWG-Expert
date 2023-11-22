//
//  RAWGAppApp.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 09/11/23.
//

import SwiftUI

@main
struct RAWGAppApp: App {
    let homePresenter = HomePresenter(homeUseCase: Injection.init().provideHome(), searchUseCase: Injection.init().provideSearch())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(homePresenter)
        }
    }
}
