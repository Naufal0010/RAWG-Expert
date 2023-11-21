//
//  RawgEntity.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 09/11/23.
//

import Foundation
import RealmSwift

class RawgEntity: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var released: String = ""
    @objc dynamic var urlBackground: String = ""
    @objc dynamic var descriptionGames: String = ""
    @objc dynamic var rating: Double = 0.0
    @objc dynamic var metacritic: Int = 0
    @objc dynamic var isFavorite: Bool = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
