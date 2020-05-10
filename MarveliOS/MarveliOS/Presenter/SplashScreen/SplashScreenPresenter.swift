//
//  SplashScreenPresenter.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 10/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import Foundation

protocol SplashScreenPresenterDelegate: class {
    func goToCharactersList()
}

class SplashScreenPresenter {
    let splashScreenProtocol: SplashScreenProtocol
    weak var delegate: SplashScreenPresenterDelegate?
    
    init(splashScreenProtocol: SplashScreenProtocol, delegate: SplashScreenPresenterDelegate?) {
        self.splashScreenProtocol = splashScreenProtocol
        self.delegate = delegate
    }
    
    func splashScreenShown() {
        delegate?.goToCharactersList()
    }
}
