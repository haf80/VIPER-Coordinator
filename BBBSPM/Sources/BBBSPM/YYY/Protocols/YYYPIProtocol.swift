//
// YYYPIProtocol.swift
//
//
// Created by Ramazan Karami on 11/01/22.
//

import Foundation

/// Presenter ~> Interactor
protocol YYYPIProtocol: AnyObject {

    var presenter: YYYIPProtocol! { get set }
}
