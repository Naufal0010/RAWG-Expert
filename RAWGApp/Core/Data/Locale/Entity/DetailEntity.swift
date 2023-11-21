//
//  DetailEntity.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 17/11/23.
//

import Foundation
import RealmSwift

class DetailEntity: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var nameOriginal: String = ""
    @objc dynamic var desc: String = ""
    @objc dynamic var released: String = ""
    @objc dynamic var backgroundImage: String = ""
    @objc dynamic var backgroundImageAdditional: String = ""
    @objc dynamic var rating: Double = 0.0
    @objc dynamic var metacritic: Int = 0
    @objc dynamic var isFavorite: Bool = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
