//
//  PLVCRouter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 28/12/22.
//

import UIKit
protocol PLVCRouterLogic {
    
}
class PLVCRouter : BaseRouter , PLVCRouterLogic {
    static func createModule() -> UIViewController {
        let vc = PLViewController()
        let interactor = PLVCInteractor()
        let router = PLVCRouter(viewController: vc)
        let presenter = PLVCPresenter(view: vc, interactor: interactor, router: router)
        vc.presenter = presenter
        return vc
    }
}
