//
//  MovieDetailContracts.swift
//  TMDb-Demo
//
//  Created by kafein on 16.08.2022.
//

import Foundation

protocol MovieDetailViewModelDelegate: class {
    func showDetail(_ presentation: MovieDetailPresentation)
}

protocol MovieDetailViewModelProtocol {
    var delegate: MovieDetailViewModelDelegate? { get set }
    func load()
}
