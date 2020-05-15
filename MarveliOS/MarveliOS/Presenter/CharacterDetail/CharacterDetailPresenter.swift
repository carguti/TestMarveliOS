//
//  CharacterDetailPresenter.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 12/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import Foundation



protocol CharacterDetailPresenterDelegate: class {
    func buttonBackPressed()
}

class CharacterDetailPresenter {
    let characterDetailProtocol: CharacterDetailProtocol
    weak var delegate: CharacterDetailPresenterDelegate?
    let searchService = SearchService()
    
    init(characterDetailProtocol: CharacterDetailProtocol, delegate: CharacterDetailPresenterDelegate?) {
        self.characterDetailProtocol = characterDetailProtocol
        self.delegate = delegate
    }
    
    func getCharacterDetail(character: Character?, completion: @escaping (CharacterDataWrapper) -> ()) {
        searchService.getCharacter(id: "\(character?.id ?? 0)") { character in
            self.characterDetailProtocol.selectedCharacter(character: character.data?.results?[0])
        }
    }
    
    func buttonBackPressed() {
        delegate?.buttonBackPressed()
    }
}
