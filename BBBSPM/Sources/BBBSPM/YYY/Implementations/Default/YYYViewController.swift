//
// YYYViewController.swift
//
//
// Created by Ramazan Karami on 11/01/22.
//

import UIKit

class YYYViewController: UIViewController {

    var presenter: YYYVPProtocol!

    @IBAction func centerButtonTouchUpInSide(_ sender: UIButton) {
        presenter.centerButtonTaped()
    }
}

// MARK: - Presenter ~> View
extension YYYViewController: YYYPVProtocol {

}

// MARK: - override
extension YYYViewController {

}

// MARK: - private
private extension YYYViewController {

}
