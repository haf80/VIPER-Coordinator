//
// YYYIPProtocol.swift
//
//
// Created by Ramazan Karami on 11/01/22.
//

import UIKit

/// Interactor ~> Presenter
protocol YYYIPProtocol: AnyObject {

    var interactor: YYYPIProtocol! { get set }
}
