//
//  ArenaPresenter.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 18/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import Foundation

protocol ArenaPresenterDelegate: class {
    func pressedButtonBack()
}

class ArenaPresenter {
    let arenaProtocol: ArenaProtocol
    weak var delegate: ArenaPresenterDelegate?
    
    init(arenaProtocol: ArenaProtocol, delegate: ArenaPresenterDelegate?) {
        self.arenaProtocol = arenaProtocol
        self.delegate = delegate
    }
    
    func buttonBackPressed() {
        delegate?.pressedButtonBack()
    }
}
