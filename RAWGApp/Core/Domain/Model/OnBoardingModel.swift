//
//  OnBoardingModel.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 15/11/23.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var onBoardingPage = Page(name: "Title Example", description: "This is description", imageUrl: "onboarding1", tag: 1)
    
    static var onBoardingPages: [Page] = [
        Page(name: "Welcome to RAWG App!", description: "Discover Endless Adventures", imageUrl: "onboarding1", tag: 0),
        Page(name: "Stay Informed!", description: "Level Up Your Gaming", imageUrl: "onboarding2", tag: 1),
        Page(name: "Explore, Rate and Share!", description: "Your Gaming Journey", imageUrl: "onboarding3", tag: 2),
    ]
}
