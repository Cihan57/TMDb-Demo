//
//  NetworkManager.swift
//  TMDb-Demo
//
//  Created by kafein on 19.08.2022.
//

import Foundation
import Moya
import Alamofire

protocol NetworkDelegate {
    var provider: MoyaProvider<API> { get }
    
    func fetchUpcomingMovies(completion: @escaping (Result<UpcomingResponse, NetworkError>) -> ())
}

final class NetworkManager : NetworkDelegate {
    
    var provider = MoyaProvider<API>(
        
        //Disable SSL
        session: Session.init(configuration: URLSessionConfiguration.af.default,
                              serverTrustManager: ServerTrustManager(evaluators: [ UrlConstants.evaluatorURL : DisabledTrustEvaluator()])) ,
        plugins: [NetworkLoggerPlugin()]
    )
    
    //MARK: --- Services
    
    func fetchUpcomingMovies(completion: @escaping (Result<UpcomingResponse, NetworkError>) -> ()) {
        request(target: .fetchUncomingMovies, completion: completion)
    }
    
}


private extension NetworkManager {
    private func request<T: Decodable>(target: API, completion: @escaping (Result<T, NetworkError>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(NetworkError.serializationError(internal: error)))
                }
            case let .failure(error):
                completion(.failure(NetworkError.networkError(internal: error)))
            }
        }
    }
}
