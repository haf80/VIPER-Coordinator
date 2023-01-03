//
// XXXViewController.swift
//
//
// Created by Ramazan Karami on 11/01/22.
//

import UIKit

class XXXViewController: UIViewController {

    var presenter: XXXVPProtocol!

    @IBAction func centerButtonTouchUpInSide(_ sender: UIButton) {
        presenter.centerButtonTaped()
    }
}

// MARK: - Presenter ~> View
extension XXXViewController: XXXPVProtocol {

}

// MARK: - override
extension XXXViewController {

}

// MARK: - private
private extension XXXViewController {

}
