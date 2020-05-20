//
//  CharactersManager.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 16/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import Foundation

class CharactersManager {
    static let shared = CharactersManager()
    var arrCharacters: [Character]?
    var arrRankingCharacters: [Character]?
    
    private init(){}
}

extension CharactersManager {
    func getCharacters() -> [Character]? {
        return arrCharacters
    }
    
    func getRankingCharacters() -> [Character]? {
        return arrRankingCharacters
    }
}
