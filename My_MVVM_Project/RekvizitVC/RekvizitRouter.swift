//
//  RekvizitViewRouter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 21/12/22.
//

import Foundation
import UIKit

protocol RekvizitViewRouterLogic {
    func pushVC()
}


class RekvizitViewRouter : BaseRouter, RekvizitViewRouterLogic {
    func pushVC() {
        self.navigationController?.pushViewController(SferaDeyatelnostViewRouter.createModule(), animated: true)
    }
    
  
    
    
    
    
    static func createModule() -> UIViewController {
        let controller = RekvizitViewController()
        let router = RekvizitViewRouter(viewController: controller)
        let interactor = RekvizitViewInteractor()
        let presenter = RekvizitViewPresenter(view: controller, interactor: interactor, router: router)
        controller.presenter = presenter
        return controller
    }
    
    
}
