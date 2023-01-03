//
// YYYBuilder.swift
//
//
// Created by Ramazan Karami on 11/01/22.
//

import UIKit

typealias YYYBuilderModel = (viewController: YYYViewController, presenter: YYYCPProtocol)

class YYYBuilder {

    static func main(_ coordinator: BBBCoordinator) -> YYYBuilderModel {

        let vc = UIStoryboard(name: "YYY", bundle: .module)
            .instantiateViewController(withIdentifier: "YYYViewController") as! YYYViewController

        let viewController = vc
        let interactor = YYYInteractor()
        let presenter = YYYPresenter()

        viewController.presenter = presenter

        presenter.interactor = interactor
        presenter.view = viewController
        presenter.coordinator = coordinator

        interactor.presenter = presenter

        return (viewController, presenter)
    }
}
