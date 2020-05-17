//
//  AppDelegate.swift
//  MarveliOS
//
//  Created by Carlos Gutierrez Casado on 09/05/2020.
//  Copyright © 2020 Carlos Gutierrez Casado. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        appCoordinator = AppCoordinator()
        appCoordinator.start()
        
        return true
    }
}

