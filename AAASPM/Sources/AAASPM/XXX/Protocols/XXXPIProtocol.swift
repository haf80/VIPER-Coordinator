//
// XXXPIProtocol.swift
//
//
// Created by Ramazan Karami on 11/01/22.
//

import Foundation

/// Presenter ~> Interactor
protocol XXXPIProtocol: AnyObject {

    var presenter: XXXIPProtocol! { get set }
}
