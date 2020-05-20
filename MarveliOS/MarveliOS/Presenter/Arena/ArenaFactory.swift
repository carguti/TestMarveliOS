//
//  ArenaFactory.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 18/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import Foundation


struct ArenaFactory {
    static func makeRankingScreen(delegate: RankingPresenterDelegate?) -> RankingViewController {
        let viewController = RankingViewController()
        let presenter = RankingPresenter(rankingProtocol: viewController, delegate: delegate)
        viewController.presenter = presenter
        return viewController
    }
}
