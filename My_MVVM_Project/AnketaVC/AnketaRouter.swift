//
//  AnketaRouter.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 12/01/23.
//

import Foundation
import UIKit
protocol AnketaRouterLogic   {
    func navto()
}
class AnketaRouter : BaseRouter,AnketaRouterLogic {
    
    static func createModule()->UIViewController {
        let vc = AnketaVC()
        let navCtrl = UINavigationController(rootViewController: vc)
        let interactor = AnketaInteractor()
        let router = AnketaRouter(viewController: vc)
        let presenter = AnketaPresenter(view: vc, interactor: interactor, router: router)
        vc.presenter = presenter
        return navCtrl
    }
    
    func navto() {
//        let vc = CalendarDialogController()
//        vc.modalPresentationStyle = .popover
//        vc.modalTransitionStyle = .crossDissolve
//        self.navigationController?.present(vc, animated: true)
    }
}
