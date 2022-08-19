//
//  MovieDetailVC.swift
//  TMDb-Demo
//
//  Created by kafein on 16.08.2022.
//

import UIKit

final class MovieDetailVC: UIViewController {
    
    @IBOutlet private weak var originalTitle: UILabel!
    @IBOutlet private weak var owerviewLabel: UILabel!
    
    var viewModel: MovieDetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.load()
    }
}

extension MovieDetailVC: MovieDetailViewModelDelegate {
    
    func showDetail(_ presentation: MovieDetailPresentation) {
        originalTitle.text = presentation.originalTitle
        owerviewLabel.text = presentation.owerview
    }
}



//let backdropPath: String
//let voteAverage: Double
//let releaseDate: String
//let originalTitle: String
//let owerview: String
