//
//  MovieDetailViewModel.swift
//  TMDb-Demo
//
//  Created by kafein on 16.08.2022.
//

import Foundation

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    weak var delegate: MovieDetailViewModelDelegate?
    private let presentation: MovieDetailPresentation
    
    init(movie: Movie) {
        self.presentation = MovieDetailPresentation(movie: movie)
    }
    
    func load() {
        delegate?.showDetail(presentation)
    }
}
