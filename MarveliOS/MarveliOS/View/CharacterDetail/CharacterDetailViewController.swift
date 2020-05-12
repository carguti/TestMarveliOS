//
//  CharacterDetailViewController.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 12/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import UIKit

protocol CharacterDetailProtocol: class {
    func selectedCharacter(character: Character?)
}

class CharacterDetailViewController: UIViewController {
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterDescriptionLabel: UILabel!
    
    var presenter: CharacterDetailPresenter?
    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.getCharacterDetail(character: character, completion: { character in
            guard let characterData = character.data?.results else { return }
            self.configureView(character: characterData[0])
        })
    }
}

extension CharacterDetailViewController {
    func configureView(character: Character) {
        characterNameLabel.text = character.name
        characterDescriptionLabel.text = character.description
        self.view.setNeedsDisplay()
    }
}

extension CharacterDetailViewController: CharacterDetailProtocol {
    func selectedCharacter(character: Character?) {
        if let character = character {
            configureView(character: character)
        }
    }
}
