//
//  NetworkError.swift
//  TMDb-Demo
//
//  Created by kafein on 19.08.2022.
//

import Foundation

public enum NetworkError: Error {
    case serializationError(internal: Error)
    case networkError(internal: Error)
}
