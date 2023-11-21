//
//  RemoteDataSource.swift
//  RAWGApp
//
//  Created by Naufal Abiyyu on 13/11/23.
//

import Foundation
import Alamofire
import Combine

protocol RemoteDataSourceProtocol: AnyObject {
    
    func getAllGames() -> AnyPublisher<[RawgResponse], Error>
    
    func getDetailGames(by id: Int) -> AnyPublisher<DetailsRawgResponse, Error>
    
}

final class RemoteDataSource: NSObject {
    
    private override init() { }
    
    static let sharedInstance: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    
    func getAllGames() -> AnyPublisher<[RawgResponse], Error> {
        return Future<[RawgResponse], Error> { completion in
            if let url = URL(string: Endpoints.Gets.allGames.url) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: RawgsResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            completion(.success(value.results))
                            debugPrint(response)
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                            debugPrint(response)
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
    
    func getDetailGames(by id: Int) -> AnyPublisher<DetailsRawgResponse, Error> {
        return Future<DetailsRawgResponse, Error> { completion in
            if let url = URL(string: Endpoints.Gets.gameDetails(id).url) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: DetailsRawgResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            completion(.success(value.self))
                            debugPrint(response)
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                            debugPrint(response)
                        }
                    }
            }
        }.eraseToAnyPublisher()
    }
}
