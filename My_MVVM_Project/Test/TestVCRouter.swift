//
//  TestViewRouter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 07/01/23.
//

import UIKit
protocol TestViewRouterLogic  {
    
}
class TestViewRouter : BaseRouter , TestViewRouterLogic {
    static func createModule() -> UIViewController {
        let vc = TestViewController()
        let interactor = TestViewInteractor()
        let router = TestViewRouter(viewController: vc)
        let presenter = TestViewPresenter(view: vc, interactor: interactor, router: router)
        vc.presenter = presenter
        return vc
    }
}
