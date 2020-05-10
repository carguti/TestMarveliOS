//
//  AppCoordinator.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 09/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import UIKit

class AppCoordinator: CoordinatorProtocol {
    private let window: UIWindow
    
    private let navigationController: UINavigationController
    var starterCoordinator: CoordinatorProtocol?
    
    init(window: UIWindow = UIWindow(),
         navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
        setupWindow()
        setupStarterCoordinator()
    }
    
    func setupWindow() {
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    func setupStarterCoordinator() {
        starterCoordinator = GeneralCoordinator(navigationController: navigationController
        )
    }
    
    func start() {
        starterCoordinator?.start()
    }
}

