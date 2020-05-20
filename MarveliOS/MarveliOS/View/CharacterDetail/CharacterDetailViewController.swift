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
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterDescriptionLabel: UILabel!
    @IBOutlet weak var buttonBack: UIButton!
    
    var presenter: CharacterDetailPresenter?
    var character: Character?
    let imageType = "/portrait_incredible."
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.getCharacterDetail(character: character, completion: { character in
            guard let characterData = character.data?.results else { return }
            self.configureView(character: characterData[0])
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func buttonBackPressed(_ sender: Any) {
        presenter?.buttonBackPressed()
    }
}

extension CharacterDetailViewController {
    func configureView(character: Character) {
        characterNameLabel.text = character.name
        characterDescriptionLabel.text = character.description
        guard var path = character.thumbnail?.path else { return }
        path.insert("s", at: path.index(path.startIndex, offsetBy: +4))
        guard let imageExtension = character.thumbnail?.imageExtension else { return }
        
        getImage(urlString: path+imageType+imageExtension) { backgroundImage in
            self.view.setNeedsDisplay()
        }
    }
    
    private func getImage(urlString: String, completion: @escaping (UIImage) -> ()) {
        backgroundImageView.sd_setImage(with: URL(string: urlString), placeholderImage: nil)
    }
}

extension CharacterDetailViewController: CharacterDetailProtocol {
    func selectedCharacter(character: Character?) {
        if let character = character {
            configureView(character: character)
        }
    }
}
