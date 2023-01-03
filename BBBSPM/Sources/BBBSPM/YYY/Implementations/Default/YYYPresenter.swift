//
// YYYPresenter.swift
//
//
// Created by Ramazan Karami on 11/01/22.
//

import UIKit

class YYYPresenter {

    var coordinator: YYYPCProtocol!
    var interactor: YYYPIProtocol!
    weak var view: YYYPVProtocol!
    
}

// MARK: - Coordinator ~> Presenter
extension YYYPresenter: YYYCPProtocol {

}

// MARK: - View ~> Presenter
extension YYYPresenter: YYYVPProtocol {

    func centerButtonTaped() {
        coordinator.showAAA()
    }
}

// MARK: - Interactor ~> Presenter
extension YYYPresenter: YYYIPProtocol {

}

// MARK: - private
private extension YYYPresenter {

}
