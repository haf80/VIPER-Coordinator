//
//  AAACoordinator.swift
//
//
//  Created by Ramazan Karami on 11/1/22.
//

import UIKit
import Tool

public class AAACoordinator: Coordinator {

    public var navigationController: UINavigationController

    weak var router: AAARouterProtocol?

    public init(
        _ navigationController: UINavigationController,
        router: AAARouterProtocol
    ) {
        self.navigationController = navigationController
        self.router = router
    }

    public func start() {
        let builder = XXXBuilder.main(self)
        navigationController.setViewControllers([builder.viewController], animated: false)
    }
}

extension AAACoordinator: AAACoordinatorProtocol {

}

extension AAACoordinator: XXXPCProtocol {

    func showBBB() {
        router?.showBBB()
    }
}
