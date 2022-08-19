//
//  API.swift
//  TMDb-Demo
//
//  Created by kafein on 17.08.2022.
//

import Moya

enum API {
    case fetchUncomingMovies
}

extension API : TargetType {
    var baseURL: URL {
        switch self {
        case .fetchUncomingMovies:
            return URL(string: String(format: UrlConstants.baseURL,"movie/upcoming?api_key=\(UrlConstants.apiKey)"))!
        default:
            return URL(string: String(format: UrlConstants.baseURL))!
        }
    }
    
    var path: String {
        switch self {
        case .fetchUncomingMovies:
            return ""
        }
    }
    
    var method: Method {
        switch self {
        case .fetchUncomingMovies:
            return .get
        }
    }
    
    var parameters: [String: Any] {
        switch self {
            //If information is requested in the body, the relevant service should be added here
        default: return [:]
        }
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .fetchUncomingMovies:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        let header: [String : String] = [
            "Content-Type" : "application/json"
        ]
        
        return header
    }
    
    var multipartBody: [Moya.MultipartFormData]? {
        return nil
    }
    
}
