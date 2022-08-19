//
//  MovieDetailBuilder.swift
//  TMDb-Demo
//
//  Created by kafein on 16.08.2022.
//

import Foundation
import UIKit

final class MovieDetailBuilder {
    
    static func make(with viewModel: MovieDetailViewModelProtocol) -> MovieDetailVC {
        let storyboard = UIStoryboard(name: "MovieList", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailVC
        viewController.viewModel = viewModel
        return viewController
    }
}
