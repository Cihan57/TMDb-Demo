//
//  MovieListViewModel.swift
//  TMDb-Demo
//
//  Created by kafein on 16.08.2022.
//

import Foundation

final class MovieListViewModel: MovieListViewModelProtocol {
    
    weak var delegate: MovieListViewModelDelegate?
    private var movies: [Movie] = []
    
    func load() {
        notify(.updateTitle("Movies"))
        notify(.setLoading(true))
        
        app.networkManager.fetchUpcomingMovies { [weak self] (result) in
            guard let self = self else { return }
            self.notify(.setLoading(false))
            
            switch result {
            case .success(let response):
                if let results = response.results {
                    self.movies = results
                    let presentations = results.map({ MovieListPresentation(movie: $0) })
                    self.notify(.showMovieList(presentations))
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectMovie(at index: Int) {
        let movie = movies[index]
        let viewModel = MovieDetailViewModel(movie: movie)
        delegate?.navigate(to: .detail(viewModel))
    }
    
    private func notify(_ output: MovieListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}

