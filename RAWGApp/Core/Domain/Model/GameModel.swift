//
//  GameModel.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 13/11/23.
//

import Foundation

struct GameModel: Equatable, Identifiable {
    let id: Int
    let name: String
    let released: String
    var desc: String
    let urlBackground: String
    let rating: Double
    let metacritic: Int
    var isFavorite: Bool = false
}
