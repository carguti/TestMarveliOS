//
//  SplashScreenPresenter.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 10/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import Foundation

protocol SplashScreenPresenterDelegate: class {
    func goToCharactersList(characters: [Character]?)
}

class SplashScreenPresenter {
    let splashScreenProtocol: SplashScreenProtocol
    weak var delegate: SplashScreenPresenterDelegate?
    let searchService = SearchService()
    var arrCharacters: [Character] = []
    
    init(splashScreenProtocol: SplashScreenProtocol, delegate: SplashScreenPresenterDelegate?) {
        self.splashScreenProtocol = splashScreenProtocol
        self.delegate = delegate
    }
    
    func splashScreenShown() {
        searchService.getCharacters(name: nil) { characters in
            guard let charactersList = characters.data?.results else { return }
            self.delegate?.goToCharactersList(characters: charactersList)
        }
    }
}
