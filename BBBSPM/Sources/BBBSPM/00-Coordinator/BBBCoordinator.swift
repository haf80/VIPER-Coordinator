//
//  BBBCoordinator.swift
//
//
//  Created by Ramazan Karami on 11/1/22.
//

import UIKit
import Tool

public class BBBCoordinator: Coordinator {

    public var navigationController: UINavigationController

    weak var router: BBBRouterProtocol?

    public init(
        _ navigationController: UINavigationController,
        router: BBBRouterProtocol
    ) {
        self.navigationController = navigationController
        self.router = router
    }

    public func start() {
        let builder = YYYBuilder.main(self)
        navigationController.setViewControllers([builder.viewController], animated: false)
    }
}

extension BBBCoordinator: BBBCoordinatorProtocol {

}

extension BBBCoordinator: YYYPCProtocol {

    func showAAA() {
        router?.showAAA()
    }
}
