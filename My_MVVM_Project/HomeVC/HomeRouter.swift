//
//  HomeRouter.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 12/01/23.
//

import UIKit
protocol HomeRouterLogic {
    func navto()
}
class HomeRouter : BaseRouter , HomeRouterLogic {
    
    static func createModule()->UIViewController {
        let vc = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter(viewController: vc)
        let presenter = HomePresenter(view: vc, interactor: interactor, router: router)
        vc.presenter = presenter
        return vc
    }
    func navto() {
        self.navigationController?.pushViewController(AnketaRouter.createModule(), animated: true)
    }
}
