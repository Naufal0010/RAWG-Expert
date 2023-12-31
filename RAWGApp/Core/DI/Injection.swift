//
//  Injection.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 14/11/23.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
    
    private func provideRepository() -> RawgRepositoryProtocol {
        let realm = try? Realm()
        
        let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance
        
        return RawgRepository.sharedInstance(locale, remote)
    }
    
    func provideHome() -> HomeUseCase {
        let repository = provideRepository()
        return HomeInteractor(repository: repository)
    }
    
    func provideDetail(detail: GameModel) -> DetailUseCase {
        let repository = provideRepository()
        return DetailInteractor(repository: repository, detail: detail)
    }
    
    func provideSearch() -> SearchUseCase {
        let repository = provideRepository()
        return SearchInteractor(repository: repository)
    }
    
    func provideFavorite() -> FavoriteUseCase {
        let repository = provideRepository()
        return FavoriteInteractor(repository: repository)
    }
}
