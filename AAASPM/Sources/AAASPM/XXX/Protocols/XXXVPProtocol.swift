//
// XXXVPProtocol.swift
//
//
// Created by Ramazan Karami on 11/01/22.
//

import Foundation

/// View ~> Presenter
protocol XXXVPProtocol: AnyObject {

    var view: XXXPVProtocol! { get set }

    func centerButtonTaped()
}
