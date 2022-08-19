//
//  MovieListPresentation.swift
//  TMDb-Demo
//
//  Created by kafein on 16.08.2022.
//

import UIKit

final class MovieListPresentation: NSObject {
    
    let title: String
    let overview: String
    let posterPath: String
    
    init(title: String, overview: String, posterPath: String) {
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
        super.init()
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? MovieListPresentation else { return false }
        return self.title == other.title &&
        self.overview == other.overview &&
        self.posterPath == other.posterPath
    }
}

extension MovieListPresentation {
    
    convenience init(movie: Movie) {
        self.init(title: movie.title,
                  overview: movie.overview,
                  posterPath: movie.posterPath)
    }
}
