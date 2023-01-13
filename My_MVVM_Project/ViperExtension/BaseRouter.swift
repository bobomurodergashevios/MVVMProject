//
//  BaseRouter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 15/12/22.
//

import Foundation
import UIKit

open class BaseRouter {
    
    private unowned var controller: UIViewController
    
    private var temporaryViewController: UIViewController?
    
    public init(viewController: UIViewController) {
        controller = viewController
        temporaryViewController = viewController
    }
    
    public var viewController: UIViewController {
        defer {
            temporaryViewController = nil
        }
        return controller
    }
    
    public var navigationController: UINavigationController? {
        viewController.navigationController
    }
    
    public func push(_ router: BaseRouter, animated: Bool) {
        push(router.viewController, animated: animated)
    }
    
    public func push(_ viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    public func backTo(nScreeen: Int) {
        let controllers = navigationController?.viewControllers ?? []
        if controllers.count > nScreeen  {
            navigationController?.popToViewController(controllers[controllers.count - nScreeen], animated: true)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
}
