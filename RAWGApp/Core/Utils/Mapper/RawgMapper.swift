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
            newGames.rating = result.rating
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
                             metacritic: result.metacritic
            )
        }
    }
    
    static func mapRawgResponsesToDomains(
        input rawgResponses: [RawgResponse]
    ) -> [GameModel] {
        return rawgResponses.map { result in
                return GameModel(id: result.id,
                                 name: result.name,
                                 released: result.released ?? "",
                                 desc: "",
                                 urlBackground: result.backgroundImage ?? "",
                                 rating: result.rating,
                                 metacritic: result.metacritic ?? 0
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
        rawgEntity.released = detailResponse.released
        rawgEntity.urlBackground = detailResponse.backgroundImage
        rawgEntity.descriptionGames = detailResponse.description
        rawgEntity.rating = detailResponse.rating
        rawgEntity.metacritic = detailResponse.metacritic
        return rawgEntity
    }
    
    static func mapDetailDetailEntityToDomain(
        input detailEntity: RawgEntity
    ) -> GameModel {
        return GameModel(
            id: detailEntity.id,
            name: detailEntity.name,
            released: detailEntity.released,
            desc: detailEntity.descriptionGames,
            urlBackground: detailEntity.urlBackground,
            rating: detailEntity.rating,
            metacritic: detailEntity.metacritic)
    }
    
    static func mapDetailEntitiesToDomains(
        input detailEntities: [DetailEntity]
    ) -> [GameDetailModel] {
        return detailEntities.map { result in
                return GameDetailModel(
                    id: result.id,
                    name: result.name,
                    nameOriginal: result.nameOriginal,
                    description: result.desc,
                    released: result.released,
                    backgroundImage: result.backgroundImage,
                    backgroundImageAdditional: result.backgroundImageAdditional,
                    rating: result.rating,
                    metacritic: result.metacritic,
                    isFavorite: result.isFavorite)
        }
    }
}
