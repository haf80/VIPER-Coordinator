#!/usr/bin/env swift

import Foundation

guard CommandLine.arguments.count > 1 else {
    print("You have to to provide a module name as the first argument.")
    exit(-1)
}

func getUserName(_ args: String...) -> String {
    let task = Process()
    let pipe = Pipe()

    task.standardOutput = pipe
    task.standardError = pipe
    task.launchPath = "/usr/bin/env"
    task.arguments = ["git", "config", "--global", "user.name"]
    task.launch()
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "VIPER"
    task.waitUntilExit()
    return output
    // return (output, task.terminationStatus)
}

let userName = getUserName()
let module = CommandLine.arguments[1]
let fileManager = FileManager.default

let workUrl = URL(fileURLWithPath: fileManager.currentDirectoryPath, isDirectory: true)
// let workUrl = fileManager.homeDirectoryForCurrentUser
let moduleUrl =         workUrl.appendingPathComponent(module)
let protocolsUrl =      moduleUrl.appendingPathComponent("Protocols")
let implmentationsUrl = moduleUrl.appendingPathComponent("Implementations")
let defaultUrl =        implmentationsUrl.appendingPathComponent("Default")

let builderUrl = moduleUrl.appendingPathComponent(module+"Builder").appendingPathExtension("swift")

let prProtocolUrl = protocolsUrl.appendingPathComponent(module+"PRProtocol").appendingPathExtension("swift")
let vpProtocolUrl = protocolsUrl.appendingPathComponent(module+"VPProtocol").appendingPathExtension("swift")
let pvProtocolUrl = protocolsUrl.appendingPathComponent(module+"PVProtocol").appendingPathExtension("swift")
let piProtocolUrl = protocolsUrl.appendingPathComponent(module+"PIProtocol").appendingPathExtension("swift")
let ipProtocolUrl = protocolsUrl.appendingPathComponent(module+"IPProtocol").appendingPathExtension("swift")

let storyboardUrl =     defaultUrl.appendingPathComponent(module).appendingPathExtension("storyboard")
let routerUrl =         defaultUrl.appendingPathComponent(module+"Router").appendingPathExtension("swift")
let presenterUrl =      defaultUrl.appendingPathComponent(module+"Presenter").appendingPathExtension("swift")
let interactorUrl =     defaultUrl.appendingPathComponent(module+"Interactor").appendingPathExtension("swift")
let viewControllerUrl = defaultUrl.appendingPathComponent(module+"ViewController").appendingPathExtension("swift")

func fileComment(for module: String, type: String) -> String {
    let today    = Date()
    let calendar = Calendar(identifier: .gregorian)
    let year     = String(calendar.component(.year, from: today)).dropFirst(2)
    let month    = String(format: "%02d", calendar.component(.month, from: today))
    let day      = String(format: "%02d", calendar.component(.day, from: today))

    return """
        //
        // \(module)\(type).swift
        //
        //
        // Created by \(userName) on \(month)/\(day)/\(year).
        //
        """
}

let prProtocol = """
\(fileComment(for: module, type: "PRProtocol"))

import UIKit

/// Presenter ~> Router
protocol \(module)PRProtocol: AnyObject {

    var viewController: UIViewController! { get set }
}
"""

let vpProtocol = """
\(fileComment(for: module, type: "VPProtocol"))

import Foundation

/// View ~> Presenter
protocol \(module)VPProtocol: AnyObject {

    var viewController: \(module)PVProtocol! { get set }
}
"""

let pvProtocol = """
\(fileComment(for: module, type: "PVProtocol"))

import UIKit

/// Presenter ~> View
protocol \(module)PVProtocol: AnyObject {

    var presenter: \(module)VPProtocol! { get set }
}
"""

let piProtocol = """
\(fileComment(for: module, type: "PIProtocol"))

import Foundation

/// Presenter ~> Interactor
protocol \(module)PIProtocol: AnyObject {

    var presenter: \(module)IPProtocol! { get set }
}
"""

let ipProtocol = """
\(fileComment(for: module, type: "IPProtocol"))

import UIKit

/// Interactor ~> Presenter
protocol \(module)IPProtocol: AnyObject {

    var interactor: \(module)PIProtocol! { get set }
}
"""

let builder = """
\(fileComment(for: module, type: "Builder"))

import UIKit

public class \(module)Builder {

    public static func main() -> \(module)ViewController {
        let viewController = \(module)ViewController.instance(bundle: Bundle.module)
        let interactor = \(module)Interactor()
        let presenter = \(module)Presenter()
        let router = \(module)Router()

        viewController.presenter = presenter

        presenter.interactor = interactor
        presenter.viewController = viewController
        presenter.router = router

        interactor.presenter = presenter

        router.viewController = viewController

        return viewController
    }
}
"""

let storyboard = """
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB" version="3.0" toolsVersion="13142" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" useSafeAreas="YES" colorMatched="YES">
    <dependencies>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="12042"/>
    </dependencies>
    <scenes/>
</document>
"""

let router = """
\(fileComment(for: module, type: "Router"))

import UIKit

class \(module)Router {

    weak var viewController: UIViewController!
}

// MARK: - Presenter ~> Router
extension \(module)Router: \(module)PRProtocol {

}
"""

let presenter = """
\(fileComment(for: module, type: "Presenter"))

import UIKit

class \(module)Presenter {

    var router: \(module)PRProtocol!
    var interactor: \(module)PIProtocol!
    weak var viewController: \(module)PVProtocol!
}

// MARK: - View ~> Presenter
extension \(module)Presenter: \(module)VPProtocol {

}

// MARK: - Interactor ~> Presenter
extension \(module)Presenter: \(module)IPProtocol {

}

// MARK: - private
private extension \(module)Presenter {

}
"""

let interactor = """
\(fileComment(for: module, type: "Interactor"))

import UIKit
import Handler

class \(module)Interactor {

    weak var presenter: \(module)IPProtocol!
}

// MARK: - Presenter ~> Interactor
extension \(module)Interactor: \(module)PIProtocol {

}
"""

let viewController = """
\(fileComment(for: module, type: "ViewController"))

import UIKit
import View

public class \(module)ViewController: HHViewController {

    var presenter: \(module)VPProtocol!
}

// MARK: - Presenter ~> View
extension \(module)ViewController: \(module)PVProtocol {

}

// MARK: - override
extension \(module)ViewController {

}

// MARK: - private
private extension \(module)ViewController {

}
"""

do {
    try [moduleUrl, protocolsUrl, implmentationsUrl, defaultUrl].forEach {
        try fileManager.createDirectory(at: $0, withIntermediateDirectories: true, attributes: nil)
    }

    try builder.write(to: builderUrl, atomically: true, encoding: .utf8)

    try prProtocol.write(to: prProtocolUrl, atomically: true, encoding: .utf8)
    try vpProtocol.write(to: vpProtocolUrl, atomically: true, encoding: .utf8)
    try pvProtocol.write(to: pvProtocolUrl, atomically: true, encoding: .utf8)
    try piProtocol.write(to: piProtocolUrl, atomically: true, encoding: .utf8)
    try ipProtocol.write(to: ipProtocolUrl, atomically: true, encoding: .utf8)

    try storyboard.write(to: storyboardUrl, atomically: true, encoding: .utf8)
    try viewController.write(to: viewControllerUrl, atomically: true, encoding: .utf8)
    try presenter.write(to: presenterUrl, atomically: true, encoding: .utf8)
    try router.write(to: routerUrl, atomically: true, encoding: .utf8)
    try interactor.write(to: interactorUrl, atomically: true, encoding: .utf8)
} catch {
    print(error.localizedDescription)
}
