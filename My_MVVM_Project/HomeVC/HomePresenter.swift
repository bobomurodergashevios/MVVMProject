//
//  HomePresenter.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 12/01/23.
//

import UIKit
protocol HomePresenterLogic : PresentationProtocol {
    func navToVC()
}
class HomePresenter : HomePresenterLogic {
    
    
    var view : HomeViewControllerLogic
    var interactor : HomeInteractorLogic
    var router : HomeRouterLogic
    
    
    init(view: HomeViewControllerLogic, interactor: HomeInteractorLogic, router: HomeRouterLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view.setupSubviews()
        view.setupTargets()
    }
    
    func navToVC() {
        self.router.navto()
    }
    
}
