//
//  IpotekaVCRouter.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 15/01/23.
//

import UIKit
protocol IpotekaVCRouterLogic  {
    func routeToKartalarVC()
}
class IpotekaVCRouter : BaseRouter, IpotekaVCRouterLogic {
    static func createModule() -> UIViewController {
        let vc = IpotekaVC()
        let router = IpotekaVCRouter(viewController: vc)
        let interactor = IpotekaVCInteractor()
        let presenter = IpotekaVCPresenter(view: vc, interactor: interactor, router: router)
        vc.presenter = presenter
        return vc
    }
    
    
    func routeToKartalarVC() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(IpotekaKartalarRouter.createModule(), animated: true)
    }
}
