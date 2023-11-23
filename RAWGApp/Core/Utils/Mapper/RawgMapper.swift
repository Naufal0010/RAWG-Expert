//
//  RawgMapper.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 09/11/23.
//

import Foundation

final class RawgMapper {
    
    static func mapRawgResponsesToEntities(
        input rawgResponses: [RawgResponse]
    ) -> [RawgEntity] {
        return rawgResponses.map { result in
            let newGames = RawgEntity()
            newGames.id = result.id 
            newGames.name = result.name 
            newGames.released = result.released ?? ""
            newGames.urlBackground = result.backgroundImage ?? ""
            newGames.rating = result.rating ?? 0.0
            newGames.metacritic = result.metacritic ?? 0
            
            return newGames
        }
    }
    
    static func mapRawgEntitiesToDomains(
        input rawgEntities: [RawgEntity]
    ) -> [GameModel] {
        return rawgEntities.map { result in
            return GameModel(id: result.id,
                             name: result.name,
                             released: result.released,
                             desc: result.descriptionGames,
                             urlBackground: result.urlBackground,
                             rating: result.rating,
                             metacritic: result.metacritic,
                             isFavorite: result.isFavorite
            )
        }
    }
    
    static func mapDetailResponsesToEntity(
        by idGame: Int,
        input detailResponse: DetailsRawgResponse
    ) -> RawgEntity {
        let rawgEntity = RawgEntity()
        rawgEntity.id = detailResponse.id
        rawgEntity.name = detailResponse.name
        rawgEntity.released = detailResponse.released ?? ""
        rawgEntity.urlBackground = detailResponse.backgroundImage
        rawgEntity.descriptionGames = detailResponse.description ?? ""
        rawgEntity.rating = detailResponse.rating ?? 0.0
        rawgEntity.metacritic = detailResponse.metacritic ?? 0
        return rawgEntity
    }
    
    static func mapDetailDetailEntityToDomain(
        input rawgEntity: RawgEntity
    ) -> GameModel {
        return GameModel(
            id: rawgEntity.id,
            name: rawgEntity.name,
            released: rawgEntity.released,
            desc: rawgEntity.descriptionGames,
            urlBackground: rawgEntity.urlBackground,
            rating: rawgEntity.rating,
            metacritic: rawgEntity.metacritic,
            isFavorite: rawgEntity.isFavorite)
    }
    
    static func mapDetailGameResponseToEntity(
        input rawgResponse: [RawgResponse]
    ) -> [RawgEntity] {
        return rawgResponse.map { result in
            let rawgEntity = RawgEntity()
            rawgEntity.id = result.id
            rawgEntity.name = result.name
            rawgEntity.released = result.released ?? ""
            rawgEntity.urlBackground = result.backgroundImage ?? ""
            rawgEntity.rating = result.rating ?? 0.0
            rawgEntity.metacritic = result.metacritic ?? 0
            return rawgEntity
        }
    }

}
