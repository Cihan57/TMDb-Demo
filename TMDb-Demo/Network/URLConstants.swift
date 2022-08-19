//
//  UrlConstants.swift
//  TMDb-Demo
//
//  Created by kafein on 19.08.2022.
//

import Foundation

class UrlConstants: NSObject {
    
    static var baseURL: String {
        //TODO:In future processes, configuration should be done according to the server environment.
        return "https://api.themoviedb.org/3/%@"
    }
    
    static var evaluatorURL: String {
        //TODO:In future processes, configuration should be done according to the server environment.
        return "api.themoviedb.org"
    }
    
    static let apiKey = "911ab954bf1488daa8fcc1c47571d0cb"
}

