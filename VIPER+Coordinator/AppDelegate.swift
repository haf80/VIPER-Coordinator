//
//  AppDelegate.swift
//  VIPER+Coordinator
//
//  Created by Ramazan Karami on 11/1/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.tintColor = UIColor.white
        appCoordinator = AppCoordinator(with: window)
        appCoordinator.start()

        return true
    }
}

