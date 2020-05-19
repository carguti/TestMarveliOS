//
//  ArenaViewController.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 18/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import UIKit
import SDWebImage

protocol ArenaProtocol: class {
    
}

class ArenaViewController: UIViewController {
    @IBOutlet weak var topCharacterName: UILabel!
    @IBOutlet weak var topCharacterAttack: UILabel!
    @IBOutlet weak var topBgImageView: UIImageView!
    @IBOutlet weak var bottomCharacterName: UILabel!
    @IBOutlet weak var bottomCharacterAttack: UILabel!
    @IBOutlet weak var bottomBgImageView: UIImageView!
    
    var presenter: ArenaPresenter?
    var characters: [Character] = []
    let imageType = "/landscape_incredible."
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func buttonBackPressed(_ sender: Any) {
        presenter?.buttonBackPressed()
    }
}

extension ArenaViewController {
    func configureViews() {
        topCharacterName.text = characters[0].name
        if let appearances = characters[0].comics?.items?.count {
            topCharacterAttack.text = "Attack power: \(appearances)"
        }
        guard var pathTopCharacter = characters[0].thumbnail?.path else { return }
        pathTopCharacter.insert("s", at: pathTopCharacter.index(pathTopCharacter.startIndex, offsetBy: +4))
        guard let imageExtensionTopCharacter = characters[0].thumbnail?.imageExtension else { return }
        
        getTopImage(urlString: pathTopCharacter+imageType+imageExtensionTopCharacter) { backgroundImage in
            self.view.setNeedsDisplay()
        }
        
        bottomCharacterName.text = characters[1].name
        if let appearances = characters[1].comics?.items?.count {
            bottomCharacterAttack.text = "Attack power: \(appearances)"
        }
        
        guard var pathBottomCharacter = characters[1].thumbnail?.path else { return }
        pathBottomCharacter.insert("s", at: pathBottomCharacter.index(pathBottomCharacter.startIndex, offsetBy: +4))
        guard let imageExtensionBottomCharacter = characters[1].thumbnail?.imageExtension else { return }
        
        getBottomImage(urlString: pathBottomCharacter+imageType+imageExtensionBottomCharacter) { backgroundImage in
            self.view.setNeedsDisplay()
        }
    }
    
    func getTopImage(urlString: String, completion: @escaping (UIImage) -> ()) {
        topBgImageView.sd_setImage(with: URL(string: urlString), placeholderImage: nil)
    }
    
    func getBottomImage(urlString: String, completion: @escaping (UIImage) -> ()) {
        bottomBgImageView.sd_setImage(with: URL(string: urlString), placeholderImage: nil)
    }
}

extension ArenaViewController: ArenaProtocol {
    
}
