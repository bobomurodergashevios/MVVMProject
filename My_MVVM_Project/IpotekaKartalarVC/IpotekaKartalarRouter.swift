//
//  IpotekaKartalarRouter.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import UIKit
protocol IpotekaKartalarRouterLogic {
    
}
class IpotekaKartalarRouter : BaseRouter , IpotekaKartalarRouterLogic {
    static func createModule()->UIViewController {
        let vc = IpotekaKartalarVCViewController()
        let interactor = IpotekaKartalarInteractor()
        let router = IpotekaKartalarRouter(viewController: vc)
        let presenter = IpotekaKartalarPresenter(view: vc, interactor: interactor, router: router)
        vc.presenter = presenter
        return vc
    }
}
