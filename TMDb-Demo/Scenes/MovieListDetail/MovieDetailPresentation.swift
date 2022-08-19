//
//  MovieDetailPresentation.swift
//  TMDb-Demo
//
//  Created by kafein on 16.08.2022.
//

import UIKit

struct MovieDetailPresentation: Equatable {
    let backdropPath: String
    let voteAverage: Double
    let releaseDate: String
    let originalTitle: String
    let owerview: String
}

extension MovieDetailPresentation {
    
    init(movie: Movie) {
        self.init(backdropPath: movie.backdropPath,
                  voteAverage: movie.voteAverage,
                  releaseDate: movie.releaseDate,
                  originalTitle: movie.originalTitle,
                  owerview: movie.overview)
    }
}
