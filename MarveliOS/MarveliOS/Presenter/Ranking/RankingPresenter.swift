//
//  RankingPresenter.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 20/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import Foundation

protocol RankingPresenterDelegate: class {
    func goBackButtonPressed()
    func showCharacter(character: Character?)
}

class RankingPresenter {
    let rankingProtocol: RankingProtocol
    weak var  delegate: RankingPresenterDelegate?
    
    init(rankingProtocol: RankingProtocol, delegate: RankingPresenterDelegate?) {
        self.rankingProtocol = rankingProtocol
        self.delegate = delegate
    }
}

extension RankingPresenter {
    func goBackButtonPresenter() {
        delegate?.goBackButtonPressed()
    }
    
    func didSelectedCharacter(character: Character) {
        delegate?.showCharacter(character: character)
    }
}
