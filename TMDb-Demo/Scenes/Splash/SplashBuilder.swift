//
//  SplashBuilder.swift
//  TMDb-Demo
//
//  Created by kafein on 16.08.2022.
//

import Foundation
import UIKit

final class SplashBuilder {
    
    static func make() -> SplashViewController {
        let storyboard = UIStoryboard(name: "Splash", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SplashVC") as! SplashViewController
        return viewController
    }
    
}
