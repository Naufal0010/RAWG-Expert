//
//  DetailMapper.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 17/11/23.
//

import Foundation

final class DetailMapper {
    
    static func mapDetailResponsesToEntity(
        by idGame: Int,
        input detailResponse: DetailsRawgResponse
    ) -> RawgEntity {
        let detailEntity = RawgEntity()
        detailEntity.descriptionGames = detailResponse.description
        return detailEntity
    }
    
    static func mapDetailDetailEntityToDomain(
        input detailEntity: DetailEntity
    ) -> GameModel {
        return GameModel(id: detailEntity.id, name: detailEntity.name, released: detailEntity.released, desc: detailEntity.desc, urlBackground: detailEntity.backgroundImage, rating: detailEntity.rating, metacritic: detailEntity.metacritic)
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
