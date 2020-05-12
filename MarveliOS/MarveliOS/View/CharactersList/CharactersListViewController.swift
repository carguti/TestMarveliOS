//
//  CharactersListViewController.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 10/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import UIKit

protocol CharacterListProtocol: class {
    
}

class CharactersListViewController: UIViewController {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: CharactersListPresenter?
    let searchService = SearchService()
    
    var arrCharacters: [Character] = []
    var selectedCharacter: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTable()
    }
}

extension CharactersListViewController {
    private func configureTable() {
         tableView.register(UINib(nibName: "CharactersListTableViewCell", bundle: nil), forCellReuseIdentifier: "CharactersListTableViewCell")
    }
}

extension CharactersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let characterCell = tableView.dequeueReusableCell(withIdentifier: "CharactersListTableViewCell", for: indexPath) as! CharactersListTableViewCell
        characterCell.configureWithCharacter(character: self.arrCharacters[indexPath.row])
        
        return characterCell
    }
}

extension CharactersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCharacter = arrCharacters[indexPath.row]
        if let selectedCharacted = selectedCharacter {
            presenter?.didSelectedCharacter(character: selectedCharacted)
        }
    }
}

extension CharactersListViewController: CharacterListProtocol {
    
}
