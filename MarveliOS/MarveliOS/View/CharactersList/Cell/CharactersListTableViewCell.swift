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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CharactersListTableViewCell {
    func configureWithCharacter(character: Character) {
        nameLabel.text = character.name
        guard let path = character.thumbnail?.path else { return }
        guard let imageExtension = character.thumbnail?.imageExtension else { return }
        let imageType = "/landscape_small."
        backgroundImageView.sd_setImage(with: URL(string: path+imageType+imageExtension), placeholderImage: nil)
    }
}
