//
//  CharactersListPresenter.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 10/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import Foundation

protocol CharactersListPresenterDelegate: class {
    func showCharacterDetail(character: Character?)
    func showArena(arrCharacters: [Character])
    func goToCharacterRanking()
}

class CharactersListPresenter {
    let charactersListProtocol: CharacterListProtocol
    weak var delegate: CharactersListPresenterDelegate?
    let searchService = SearchService()
    var arrCharacters: [Character] = []
    var characterNames: [String] = []
    
    init(charactersListProtocol: CharacterListProtocol, delegate: CharactersListPresenterDelegate?) {
        self.charactersListProtocol = charactersListProtocol
        self.delegate = delegate
    }
    
    func didSelectedCharacter(character: Character) {
        delegate?.showCharacterDetail(character: character)
    }
    
    func goToArena(arrCharacters: [Character]) {
        delegate?.showArena(arrCharacters: arrCharacters)
    }
    
    func getCharactersNames(characters: [Character]) -> [String]? {
        for character in characters {
            if let name = character.name {
                characterNames.append(name)
            }
        }
        
        return characterNames
    }
    
    func goToRanking() {
        delegate?.goToCharacterRanking()
    }
}
