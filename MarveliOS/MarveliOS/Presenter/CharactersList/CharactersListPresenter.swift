//
//  CharactersListPresenter.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 10/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import Foundation

protocol CharactersListPresenterDelegate: class {
    func showCharacterDetail()
}

class CharactersListPresenter {
    let charactersListProtocol: CharacterListProtocol
    weak var delegate: CharactersListPresenterDelegate?
    let searchService = SearchService()
    var arrCharacters: [Character] = []
    
    init(charactersListProtocol: CharacterListProtocol, delegate: CharactersListPresenterDelegate?) {
        self.charactersListProtocol = charactersListProtocol
        self.delegate = delegate
    }
}
