//
//  GeneralCoordinator.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 09/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import UIKit

import UIKit

class GeneralCoordinator: CoordinatorProtocol {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func start() {
        showSplashScreen()
    }
}

extension GeneralCoordinator {
    func showSplashScreen() {
        let scene = SplashScreenFactory.makeSplashScreen(delegate: self)
        navigationController.viewControllers = [scene]
    }
    
    func showCharactersListScreen(characters: [Character]?) {
        let scene = SplashScreenFactory.makeCharacteresList(delegate: self, characters: characters)
        navigationController.viewControllers = [scene]
    }
}

extension GeneralCoordinator: SplashScreenPresenterDelegate {
    func goToCharactersList(characters: [Character]?) {
        showCharactersListScreen(characters: characters)
    }
}

extension GeneralCoordinator: CharactersListPresenterDelegate {
    func showCharacterDetail() {
        
    }
}
