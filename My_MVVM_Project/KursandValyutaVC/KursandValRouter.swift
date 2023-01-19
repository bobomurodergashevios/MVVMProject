//
//  KursAndValyutaViewRouter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 27/12/22.
//

import UIKit

protocol KursAndValyutaViewRouterLogic {
    func presentVC()
}
class KursAndValyutaViewRouter : BaseRouter , KursAndValyutaViewRouterLogic {
    static func createModule() -> UIViewController {
        let vc = KursAndValyutaViewController()
        let interactor = KursAndValyutaViewInteractor()
        let router = KursAndValyutaViewRouter(viewController: vc)
        let presenter = KursAndValyutaViewPresenter(view: vc, interactor: interactor, router: router)
        vc.presenter = presenter
        return vc
    }
    func presentVC() {
        let dialog = DPICKERViewController()
        dialog.modalTransitionStyle = .coverVertical
        dialog.modalPresentationStyle = .popover
        dialog.modalPresentationCapturesStatusBarAppearance = false
        self.navigationController?.present(dialog, animated: true)
    }
    
}
