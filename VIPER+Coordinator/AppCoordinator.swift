//
//  AppCoordinator.swift
//  VIPER+Coordinator
//
//  Created by Ramazan Karami on 11/1/22.
//

import UIKit
import AAASPM
import BBBSPM
import Tool

class AppCoordinator {

    private var navigationController: UINavigationController

    private var aaa: AAACoordinatorProtocol?
    private var bbb: BBBCoordinatorProtocol?

    init(with window: UIWindow?) {
        self.navigationController = UINavigationController()
        window?.rootViewController = navigationController
    }

    func start() {
        showAAA()
    }
}

extension AppCoordinator: AAARouterProtocol {

    func showBBB() {
        bbb = BBBCoordinator(navigationController, router: self)
        bbb?.start()
    }
}

extension AppCoordinator: BBBRouterProtocol {

    func showAAA() {
        aaa = AAACoordinator(navigationController, router: self)
        aaa?.start()
    }
}

private extension AppCoordinator {

}
