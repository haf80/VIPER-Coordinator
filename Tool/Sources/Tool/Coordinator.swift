//
//  Coordinator.swift
//
//
//  Created by Ramazan Karami on 11/1/22.
//

import UIKit

public protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
