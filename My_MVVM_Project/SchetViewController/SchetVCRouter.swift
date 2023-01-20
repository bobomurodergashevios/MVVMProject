//
//  SchetVCRouter.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 20/01/23.
//

import UIKit

protocol SchetVCRouterLogic {
    func navto()
}
class SchetVCRouter : BaseRouter , SchetVCRouterLogic {
     
    static func createModule() -> UIViewController {
      let vc = SchetViewController()
        let interactor = SchetVCInteractor()
        let router = SchetVCRouter(viewController: vc)
        let presenter = SchetVCPresenter(view: vc, interactor: interactor, router: router)
        vc.presenter = presenter
        return vc
    }
    
    func navto() {
        let dialog = SelectedDataDialog()
        
        self.navigationController?.present(dialog, animated: true)
        
    }
}
