//
//  RawgsResponse.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 09/11/23.
//

import Foundation

// MARK: - Rawg
struct RawgsResponse: Decodable {
    let results: [RawgResponse]
}

// MARK: - RAWG
struct RawgResponse: Decodable {
    let id: Int
    let name: String
    let released: String?
    let backgroundImage: String?
    let rating: Double
    let metacritic: Int?
    let genres: [Genre]
    let shortScreenshots: [ShortScreenshot]

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case backgroundImage = "background_image"
        case rating
        case released
        case metacritic
        case genres
        case shortScreenshots = "short_screenshots"
    }
}

// MARK: - Genre
struct Genre: Decodable {
    let id: Int
    let name: String
}

// MARK: - ShortScreenshot
struct ShortScreenshot: Decodable {
    let id: Int
    let image: String
}
