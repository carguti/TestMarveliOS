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
    
    func showCharacterDetailScreen(character: Character) {
        let scene = CharactersListFactory.makeCharacterDetail(delegate: self, character: character)
        navigationController.viewControllers = [scene]
    }
    
    func showArenaScreen(characters: [Character]) {
        let scene = CharactersListFactory.makeArena(delegate: self, characters: characters)
        navigationController.viewControllers = [scene]
    }
    
    func showRankingScreen() {
        let scene = ArenaFactory.makeRankingScreen(delegate: self)
        navigationController.viewControllers = [scene]
    }
}

extension GeneralCoordinator: SplashScreenPresenterDelegate {
    func goToCharactersList(characters: [Character]?) {
        showCharactersListScreen(characters: characters)
    }
}

extension GeneralCoordinator: CharactersListPresenterDelegate {
    func showCharacterDetail(character: Character?) {
        if let character = character {
            showCharacterDetailScreen(character: character)
        }
    }
    
    func showArena(arrCharacters: [Character]) {
        showArenaScreen(characters: arrCharacters)
    }
    
    func goToCharacterRanking() {
        showRankingScreen()
    }
}

extension GeneralCoordinator: CharacterDetailPresenterDelegate {
    func buttonBackPressed() {
        showCharactersListScreen(characters: CharactersManager.shared.getCharacters())
    }
}

extension GeneralCoordinator: ArenaPresenterDelegate {
    func pressedButtonBack() {
        showCharactersListScreen(characters: CharactersManager.shared.getCharacters())
    }
    
    
    func goToRanking() {
        showRankingScreen()
    }
}

extension GeneralCoordinator: RankingPresenterDelegate {
    func goBackButtonPressed() {
        showCharactersListScreen(characters: CharactersManager.shared.getCharacters())
    }
    
    func showCharacter(character: Character?) {
        showCharacterDetail(character: character)
    }
}
