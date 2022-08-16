//
//  SplashViewController.swift
//  TMDb-Demo
//
//  Created by kafein on 15.08.2022.
//

import Foundation
import UIKit

final class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.goMovies()
        }
    }
    
    func goMovies(){
        let vc = MovieListBuilder.make()
        self.present(vc, animated: true, completion: nil)
    }
    
}
