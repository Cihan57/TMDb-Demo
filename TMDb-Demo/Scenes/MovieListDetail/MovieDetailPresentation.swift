//
//  MovieDetailPresentation.swift
//  TMDb-Demo
//
//  Created by kafein on 16.08.2022.
//

import UIKit

struct MovieDetailPresentation: Equatable {
    let posterPath: String
    let voteAverage: Double
    let releaseDate: String
    let title: String
    let owerview: String
}

extension MovieDetailPresentation {
    
    init(movie: Movie) {
        self.init(posterPath: movie.posterPath,
                  voteAverage: movie.voteAverage,
                  releaseDate: movie.releaseDate,
                  title: movie.title,
                  owerview: movie.overview)
    }
}
