//
//  RawgsDetailResponse.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 13/11/23.
//

import Foundation

// MARK: - DetailRAWG
struct DetailsRawgResponse: Decodable {
    let id: Int
    let name: String
    let nameOriginal: String
    let description: String?
    let released: String?
    let backgroundImage: String
    let backgroundImageAdditional: String
    let rating: Double?
    let metacritic: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case nameOriginal = "name_original"
        case description
        case released
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
        case rating
        case metacritic
    }
}
