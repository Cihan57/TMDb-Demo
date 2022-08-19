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
    
    init(title: String, overview: String) {
        self.title = title
        self.overview = overview
        super.init()
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? MovieListPresentation else { return false }
        return self.title == other.title && self.overview == other.overview
    }
}

extension MovieListPresentation {
    
    convenience init(movie: Movie) {
        self.init(title: movie.title,
                  overview: movie.overview)
    }
}
