//
// YYYVPProtocol.swift
//
//
// Created by Ramazan Karami on 11/01/22.
//

import Foundation

/// View ~> Presenter
protocol YYYVPProtocol: AnyObject {

    var view: YYYPVProtocol! { get set }

    func centerButtonTaped()
}
