//
//  Router.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import Foundation

import UIKit
protocol SimpleRouterLogic {
    func pushVC()
    func navigationToSettingVC()
}


class MyViewRouter : BaseRouter, SimpleRouterLogic {
    func navigationToSettingVC() {
//        self.navigationController?.pushViewController(SettingVCRouter.createModule(), animated: true)
    }
    
    func pushVC() {
//        self.navigationController?.pushViewController(AnketaViewRouter.createModule(), animated: true)
    }

    
    static func createModule() -> UIViewController {
        let controller = MyViewController()
        let router = MyViewRouter(viewController: controller)
        let interactor = MyViewInteractor()
        let presenter = MyViewPresenter(view: controller, interactor: interactor, router: router)
        controller.presenter = presenter
        return controller
    }
    
    
    
}
