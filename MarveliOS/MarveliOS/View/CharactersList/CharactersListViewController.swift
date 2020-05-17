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
    @IBOutlet weak var searchView: UIView!
    
    var presenter: CharactersListPresenter?
    let searchService = SearchService()
    
    var arrCharacters: [Character] = []
    var selectedCharacter: Character?
    var arrCharacterNames: [String]?
    var filteredCharacters: [Character] = []
    let searchController = UISearchController(searchResultsController: nil)
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCharactersNames()
        configureSearchBar()
        configureTable()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if #available(iOS 13.0, *) {
            searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search characters", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        }
    }
}

extension CharactersListViewController {
    private func configureTable() {
         tableView.register(UINib(nibName: "CharactersListTableViewCell", bundle: nil), forCellReuseIdentifier: "CharactersListTableViewCell")
    }
    
    func getCharactersNames() {
        arrCharacterNames = presenter?.getCharactersNames(characters: self.arrCharacters)
    }
    
    func filterContentForSearchText(_ searchText: String, category: Character? = nil) {
      filteredCharacters = arrCharacters.filter { (character: Character) -> Bool in
        return character.name!.lowercased().contains(searchText.lowercased())
      }
      
      tableView.reloadData()
    }
    
    func configureSearchBar() {
        let searchBar = searchController.searchBar
        searchView.addSubview(searchController.searchBar)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = true
        searchBar.placeholder = "Search characters"
        searchBar.barTintColor = .white
        searchBar.backgroundColor = .clear
        searchBar.tintColor = .white
        searchBar.cornerRadius = 24
        navigationItem.searchController = searchController
        definesPresentationContext = false
        let textFieldInsideSearchBar = searchController.searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .white
    }
}

extension CharactersListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    
    
}

extension CharactersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
          return filteredCharacters.count
        }
          
        return arrCharacters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let characterCell = tableView.dequeueReusableCell(withIdentifier: "CharactersListTableViewCell", for: indexPath) as! CharactersListTableViewCell
        
        let character: Character
        if isFiltering {
            character = filteredCharacters[indexPath.row]
        } else {
            character = arrCharacters[indexPath.row]
        }
        
        characterCell.configureWithCharacter(character: character)
        
        return characterCell
    }
}

extension CharactersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isFiltering {
            selectedCharacter = filteredCharacters[indexPath.row]
        } else {
            selectedCharacter = arrCharacters[indexPath.row]
        }
        
        if let selectedCharacted = selectedCharacter {
            presenter?.didSelectedCharacter(character: selectedCharacted)
        }
    }
}

extension CharactersListViewController: CharacterListProtocol {
    
}
