//
//  RankingViewController.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 20/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import UIKit

protocol RankingProtocol: class {
    
}

class RankingViewController: UIViewController {
    var presenter: RankingPresenter?
    var arrRankingCharacters: [Character] = []
    var sortedRankingCharacters: [Character] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        presenter?.goBackButtonPresenter()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arrRankingCharacters = CharactersManager.shared.getRankingCharacters() ?? []
        sortedRankingCharacters = arrRankingCharacters.sorted {
            ($0.comics?.items?.count ?? 0) > ($1.comics?.items?.count ?? 0)
        }
        configureTable()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

extension RankingViewController {
    private func configureTable() {
         tableView.register(UINib(nibName: "CharactersListTableViewCell", bundle: nil), forCellReuseIdentifier: "CharactersListTableViewCell")
    }
}

extension RankingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedRankingCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let characterCell = tableView.dequeueReusableCell(withIdentifier: "CharactersListTableViewCell", for: indexPath) as! CharactersListTableViewCell
        let character: Character
        character = sortedRankingCharacters[indexPath.row]
        characterCell.configureWithCharacter(character: character)
        
        return characterCell
    }
}

extension RankingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCharacter = self.sortedRankingCharacters[indexPath.row]
        presenter?.didSelectedCharacter(character: selectedCharacter)
    }
}

extension RankingViewController: RankingProtocol { }
