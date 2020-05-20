//
//  ArenaViewController.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 18/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import UIKit
import SDWebImage

protocol ArenaProtocol: class { }

class ArenaViewController: UIViewController {
    @IBOutlet weak var topCharacterName: UILabel!
    @IBOutlet weak var topCharacterAttack: UILabel!
    @IBOutlet weak var topBgImageView: UIImageView!
    @IBOutlet weak var bottomCharacterName: UILabel!
    @IBOutlet weak var bottomCharacterAttack: UILabel!
    @IBOutlet weak var bottomBgImageView: UIImageView!
    @IBOutlet weak var vsImageView: UIImageView!
    
    var presenter: ArenaPresenter?
    var characters: [Character] = []
    private let imageType = "/landscape_incredible."
    private var characterWinner: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
        startCountdown()
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
    
    private func getTopImage(urlString: String, completion: @escaping (UIImage) -> ()) {
        topBgImageView.sd_setImage(with: URL(string: urlString), placeholderImage: nil)
    }
    
    private func getBottomImage(urlString: String, completion: @escaping (UIImage) -> ()) {
        bottomBgImageView.sd_setImage(with: URL(string: urlString), placeholderImage: nil)
    }
    
    private func startCountdown() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.vsImageView.image = UIImage.init(named: "icnBoom")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.vsImageView.image = UIImage.init(named: "icnPfoom")
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.vsImageView.image = UIImage.init(named: "icnBazinga")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.showWinnerAlert()
                    }
                }
            }
        }
    }
    
    private func showWinnerAlert() {
        getWinner()
    }
    
    private func getWinner() {
        if let character1Power = characters[0].comics?.items?.count, let character2Power = characters[1].comics?.items?.count {
            if character1Power < character2Power {
                characterWinner = characters[1]
            } else if character1Power > character2Power {
                characterWinner = characters[0]
            } else {
                characterWinner = nil
            }
        }
        
        var alertMessage: String?
        if let winner = characterWinner {
            alertMessage = winner.name
        } else {
            alertMessage = "Draw!"
        }
        
        let winnerAlert = UIAlertController(title: "WINNER!!".uppercased(), message: alertMessage, preferredStyle: .alert)
        let actionRanking = UIAlertAction(title: "Go to Ranking!", style: .default, handler: { action in
            self.presenter?.goToRanking()
        })
        let actionAccept = UIAlertAction(title: "Accept", style: .default, handler: nil)
        winnerAlert.addAction(actionRanking)
        winnerAlert.addAction(actionAccept)
        present(winnerAlert, animated: true)
    }
}

extension ArenaViewController: ArenaProtocol { }
