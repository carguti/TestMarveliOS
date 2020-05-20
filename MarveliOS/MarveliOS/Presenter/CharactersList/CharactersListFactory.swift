//
//  CharactersListFactory.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 10/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import Foundation

struct CharactersListFactory {
    static func makeCharacterDetail(delegate: CharacterDetailPresenterDelegate?, character: Character?) -> CharacterDetailViewController {
        let viewController = CharacterDetailViewController()
        let presenter = CharacterDetailPresenter(characterDetailProtocol: viewController, delegate: delegate)
        viewController.presenter = presenter
        if let character = character {
            viewController.character = character
        }
        return viewController
    }
    
    static func makeArena(delegate: ArenaPresenterDelegate?, characters: [Character]?) -> ArenaViewController {
        let viewController = ArenaViewController()
        let presenter = ArenaPresenter(arenaProtocol: viewController, delegate: delegate)
        viewController.presenter = presenter
        if let characters = characters {
            viewController.characters = characters
        }
        return viewController
    }
}
