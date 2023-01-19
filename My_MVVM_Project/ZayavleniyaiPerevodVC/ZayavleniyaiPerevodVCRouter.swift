//
//  ZayavleniyaVCRouter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 26/12/22.
//

import UIKit
protocol ZayavleniyaVCRouterLogic {
    
}

class ZayavleniyaVCRouter : BaseRouter , ZayavleniyaVCRouterLogic {
    
   static func createModule() -> UIViewController {
        let vc = ZayavleniyaVC()
        let interactor = ZayavleniyaVCInteractor()
        let router = ZayavleniyaVCRouter(viewController: vc)
        let presenter = ZayavleniyaVCPresenter(view: vc, interactor: interactor, router: router)
        vc.presenter = presenter
        return vc
    }
}
