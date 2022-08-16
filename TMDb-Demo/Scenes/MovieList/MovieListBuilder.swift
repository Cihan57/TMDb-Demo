//
//  MovieListBuilder.swift
//  TMDb-Demo
//
//  Created by kafein on 16.08.2022.
//

import Foundation
import UIKit

final class MovieListBuilder {
    
    static func make() -> MovieListVC {
        let storyboard = UIStoryboard(name: "MovieList", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MovieListVC") as! MovieListVC
        viewController.modalPresentationStyle = .overFullScreen
        return viewController
    }
    
}
