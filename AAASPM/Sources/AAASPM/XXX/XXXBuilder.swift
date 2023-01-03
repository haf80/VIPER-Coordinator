//
// XXXBuilder.swift
//
//
// Created by Ramazan Karami on 11/01/22.
//

import UIKit

typealias XXXBuilderModel = (viewController: XXXViewController, presenter: XXXCPProtocol)

class XXXBuilder {

    static func main(_ coordinator: AAACoordinator) -> XXXBuilderModel {

        let vc = UIStoryboard(name: "XXX", bundle: .module)
            .instantiateViewController(withIdentifier: "XXXViewController") as! XXXViewController

        let viewController = vc
        let interactor = XXXInteractor()
        let presenter = XXXPresenter()

        viewController.presenter = presenter

        presenter.interactor = interactor
        presenter.view = viewController
        presenter.coordinator = coordinator

        interactor.presenter = presenter

        return (viewController, presenter)
    }
}
