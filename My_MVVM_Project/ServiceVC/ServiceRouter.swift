//
//  ServicesViewRouter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 21/12/22.
//

import UIKit

protocol ServicesViewRouterLogic {
    func pushvc()
    func pushOtkritBtnTapped()
    func pushMoreBtnTapped()
}
class ServicesViewRouter : BaseRouter,ServicesViewRouterLogic{
    
    func pushvc() {
        self.navigationController?.pushViewController(SferaDeyatelnostViewRouter.createModule(), animated: true)
    }
    
    func pushOtkritBtnTapped() {
        self.navigationController?.pushViewController(AnketaRouter  .createModule(), animated: true)
    }
    
    func pushMoreBtnTapped() {
        self.navigationController?.pushViewController(MyViewRouter.createModule(), animated: true)
    }
    
    static func createModule() -> UIViewController {
        let vc = ServicesViewController()
        let interactor = ServicesViewInteractor()
        let router = ServicesViewRouter(viewController: vc)
        let presenter = ServicesViewPresenter(view: vc, interactor: interactor, router: router)
        vc.presenter = presenter
        return vc
    }
    
}
