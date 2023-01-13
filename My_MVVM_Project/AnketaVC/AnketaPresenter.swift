//
//  AnketaPresenter.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 12/01/23.
//

import Foundation
import UIKit
protocol AnketaPresenterLogic : PresentationProtocol {
    func navToVC()
}
class AnketaPresenter : AnketaPresenterLogic {
   
    var view : AnketaVCLogic
    var interactor : AnketaInteractorLogic
    var router : AnketaRouterLogic
    var controller : AnketaVC!
    init(view: AnketaVCLogic, interactor: AnketaInteractorLogic, router: AnketaRouterLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view.setupSubviews()
        view.setupTargets()
    }
    
    func navToVC() {
//        router.navto()
    }
}
