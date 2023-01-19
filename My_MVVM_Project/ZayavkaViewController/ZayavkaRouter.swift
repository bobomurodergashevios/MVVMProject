
//
//  ZayavkaViewRouter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 19/12/22.
//

import UIKit

protocol ZayavkaRouterLogic {
//    func pushVC()
    func pushVC()
}


class ZayavkaViewRouter : BaseRouter, ZayavkaRouterLogic {
    func pushVC() {
        self.navigationController?.pushViewController(RekvizitViewRouter.createModule(), animated: true)
//        print(data)
    }
    
  
    
    static func createModule() -> UIViewController {
        let controller = ZayavkaViewController()
        let router = ZayavkaViewRouter(viewController: controller)
        let interactor = ZayavkaViewInteractor()
        let presenter = ZayavkaViewPresenter(view: controller, interactor: interactor, router: router)
        controller.presenter = presenter
        return controller
    }
    
    
}
