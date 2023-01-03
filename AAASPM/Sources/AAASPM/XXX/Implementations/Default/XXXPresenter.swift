//
// XXXPresenter.swift
//
//
// Created by Ramazan Karami on 11/01/22.
//

import UIKit

class XXXPresenter {

    var coordinator: XXXPCProtocol!
    var interactor: XXXPIProtocol!
    weak var view: XXXPVProtocol!
    
}

// MARK: - Coordinator ~> Presenter
extension XXXPresenter: XXXCPProtocol {

}

// MARK: - View ~> Presenter
extension XXXPresenter: XXXVPProtocol {

    func centerButtonTaped() {
        coordinator.showBBB()
    }
}

// MARK: - Interactor ~> Presenter
extension XXXPresenter: XXXIPProtocol {

}

// MARK: - private
private extension XXXPresenter {

}
