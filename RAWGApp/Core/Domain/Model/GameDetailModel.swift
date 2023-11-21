//
//  GameDetailModel.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 14/11/23.
//

import Foundation

struct GameDetailModel: Equatable, Identifiable {
    let id: Int
    let name: String
    var nameOriginal: String
    var description: String
    let released: String
    let backgroundImage: String
    var backgroundImageAdditional: String
    let rating: Double
    let metacritic: Int
    var isFavorite: Bool = false
}
