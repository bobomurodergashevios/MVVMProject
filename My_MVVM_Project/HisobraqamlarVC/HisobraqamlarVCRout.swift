//
//  HisobraqamlarViewRouter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 10/01/23.
//

import UIKit
protocol HisobraqamlarViewRouterLogic {
    
}
class HisobraqamlarViewRouter : BaseRouter, HisobraqamlarViewRouterLogic {
    static func createModule() -> UIViewController {
        let vc = HisobraqamlarViewController()
        let interactor = HisobraqamlarViewInteractor()
        let router = HisobraqamlarViewRouter(viewController: vc)
        let presenter = HisobraqamlarViewPresenter(view: vc, interactor: interactor, router: router)
        vc.presenter = presenter
        return vc
    }
}
