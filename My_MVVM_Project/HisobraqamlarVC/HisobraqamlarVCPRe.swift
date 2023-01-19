//
//  HisobraqamlarViewPresenter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 10/01/23.
//

import UIKit

protocol HisobraqamlarViewPresenterLogic : PresentationProtocol {
    
}
class HisobraqamlarViewPresenter : HisobraqamlarViewPresenterLogic {
   
    var view : HisobraqamlarViewControllerLogic
    var interactor : HisobraqamlarViewInteractorLogic
    var router : HisobraqamlarViewRouterLogic
    
    init(view: HisobraqamlarViewControllerLogic, interactor: HisobraqamlarViewInteractorLogic, router: HisobraqamlarViewRouterLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view.setupSubviews()
        view.setupTargets()
    }
    
}
