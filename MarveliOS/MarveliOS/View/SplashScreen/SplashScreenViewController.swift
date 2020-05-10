//
//  SplashScreenViewController.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 10/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import UIKit

protocol SplashScreenProtocol: class {
    
}

class SplashScreenViewController: UIViewController {
    var presenter: SplashScreenPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        configureViews()
        presenter?.splashScreenShown()
    }
}

extension SplashScreenViewController {
    func configureViews() {
        self.view.backgroundColor?.withAlphaComponent(0.5)
    }
}

extension SplashScreenViewController: SplashScreenProtocol {
    
}
