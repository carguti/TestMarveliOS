//
//  CharactersListTableViewCell.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 10/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import UIKit
import SDWebImage

class CharactersListTableViewCell: UITableViewCell {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    let imageType = "/landscape_incredible."
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}

extension CharactersListTableViewCell {
    func configureWithCharacter(character: Character) {
        nameLabel.text = character.name
        guard var path = character.thumbnail?.path else { return }
        path.insert("s", at: path.index(path.startIndex, offsetBy: +4))
        guard let imageExtension = character.thumbnail?.imageExtension else { return }
        
        getImage(urlString: path+imageType+imageExtension) { backgroundImage in
            self.setNeedsDisplay()
        }
    }
    
    func getImage(urlString: String, completion: @escaping (UIImage) -> ()) {
        backgroundImageView.sd_setImage(with: URL(string: urlString), placeholderImage: nil)
    }
}
