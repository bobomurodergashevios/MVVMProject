//
//  PLVCPresenter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 28/12/22.
//

import UIKit
protocol PLVCPresenterLogic : PresentationProtocol {
    
}
class PLVCPresenter : PLVCPresenterLogic {
    
    
    var view : PLViewControllerLogic
    var interactor : PLVCInteractorLogic
    var router : PLVCRouterLogic
    var controller : PLViewController {view as! PLViewController}
    
    
    init(view: PLViewControllerLogic, interactor: PLVCInteractorLogic, router: PLVCRouterLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view.setupTargets()
        view.setupSubviews()
    }
    
}
