//
//  Routere.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//


import UIKit
protocol SferaDeyatelnostViewRouterProtocol {
    func pushVC()
}

class SferaDeyatelnostViewRouter : BaseRouter, SferaDeyatelnostViewRouterProtocol {
    
    static func createModule() -> UIViewController {
        let controller = SferaDeyatelnostViewController()
        let router = SferaDeyatelnostViewRouter(viewController: controller)
        let interactor = SferaDeyatelnostViewInteractor()
        let presenter = SferaDeyatelnostViewPresenter(view: controller, interactor: interactor, router: router)
        controller.presenter = presenter
        return controller
    }
    
    func pushVC() {
        self.navigationController?.pushViewController(NextViewController(), animated: true)
        print("tappeddddd")
    }
    
}
