//
// YYYPVProtocol.swift
//
//
// Created by Ramazan Karami on 11/01/22.
//

import UIKit

/// Presenter ~> View
protocol YYYPVProtocol: AnyObject {

    var presenter: YYYVPProtocol! { get set }
}
