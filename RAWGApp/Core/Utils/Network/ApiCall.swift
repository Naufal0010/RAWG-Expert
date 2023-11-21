//
//  ApiCall.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 09/11/23.
//

import Foundation

struct API {
    
    static let baseUrl = "https://api.rawg.io/api"
    
    static var apiKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "RAWG-info", ofType: "plist") else {
                fatalError("Couldn't find file 'RAWG-info.plist'.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "API_KEY") as? String else {
                fatalError("Couldn't find key 'API_KEY' in 'RAWG-info.plist'.")
            }
            
            return value
        }
    }
    
}

protocol Endpoint {
    
    var url: String { get }
}

enum Endpoints {
    
    enum Gets: Endpoint {
        case allGames
        case gameDetails(_ gameId: Int)
        case searchGames
        
        public var url: String {
            switch self {
            case .allGames: return "\(API.baseUrl)/games?key=\(API.apiKey)"
            case .gameDetails(let gameId): return "\(API.baseUrl)/games/\(gameId)?key=\(API.apiKey)"
            case .searchGames: return "\(API.baseUrl)/games?key=\(API.apiKey)&search="
            }
        }
    }
}
