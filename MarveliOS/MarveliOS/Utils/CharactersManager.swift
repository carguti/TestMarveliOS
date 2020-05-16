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
    
    private init(){}
    
    func getCharacters() -> [Character]?{
        return arrCharacters
    }
}
