//
//  MovieDetailVC.swift
//  TMDb-Demo
//
//  Created by kafein on 16.08.2022.
//

import UIKit
import Kingfisher

final class MovieDetailVC: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var originalTitle: UILabel!
    @IBOutlet weak var owerviewTextView: UITextView!
    
    var viewModel: MovieDetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.load()
        
        circleView.makeRounded()
    }
}

extension MovieDetailVC: MovieDetailViewModelDelegate {
    
    func showDetail(_ presentation: MovieDetailPresentation) {
        movieImageView.kf.setImage(with: URL(string: String(format: "https://image.tmdb.org/t/p/original%@",presentation.posterPath)))
        ratingLabel.text = String(presentation.voteAverage) + "/10"
        dateLabel.text = Utils.formattedDateFromString(dateString: presentation.releaseDate, withFormat: "dd.MM.yyyy")
        originalTitle.text = presentation.title
        owerviewTextView.text = presentation.owerview
    }
}
