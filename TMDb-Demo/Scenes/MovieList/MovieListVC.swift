//
//  MovieListVC.swift
//  TMDb-Demo
//
//  Created by kafein on 15.08.2022.
//

import UIKit
import JGProgressHUD

final class MovieListVC: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel = MovieListViewModel()
    let hud = JGProgressHUD()
    
    private var movieList: [MovieListPresentation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.load()
        tableView.register(MovieCell.nib(), forCellReuseIdentifier: MovieCell.identifier)
    }
    
}

extension MovieListVC: MovieListViewModelDelegate {
    
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isLoading):
            if isLoading {
                hud.show(in: self.view)
            } else {
                hud.dismiss(animated: true)
            }
        case .showMovieList(let movieList):
            self.movieList = movieList
            tableView.reloadData()
        }
    }
    
    func navigate(to route: MovieListViewRoute) {
        switch route {
        case .detail(let viewModel):
            /* NOTE:
                Since we have the id and other information of the selected movie,
                it was not necessary to go to the service again.
            */
            let viewController = MovieDetailBuilder.make(with: viewModel)
            show(viewController, sender: nil)
        }
    }
}

extension MovieListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell {
            let movie = movieList[indexPath.row]
            cell.titleLabel.text = movie.title
            cell.owerviewLabel.text = movie.overview
            cell.dateLabel.text = Utils.formattedDateFromString(dateString: movie.releaseDate, withFormat: "dd.MM.yyyy")
            cell.postImageURL = String(format: "https://image.tmdb.org/t/p/original%@", movie.posterPath)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
}

extension MovieListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.selectMovie(at: indexPath.row)
    }
}
