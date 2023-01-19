//
//  IpotekaVCPresenter.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 15/01/23.
//

import UIKit
protocol IpotekaVCPresenterLogic: PresentationProtocol {
    func navToKartalarVC()
}

class IpotekaVCPresenter : IpotekaVCPresenterLogic {
    
    
   
    var view : IpotekaVCLogic
    var interactor : IpotekaVCInteractorLogic
    var router : IpotekaVCRouterLogic
    
    
    init(view: IpotekaVCLogic, interactor: IpotekaVCInteractorLogic, router: IpotekaVCRouterLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view.setupSubviews()
        view.setupTargets()
        
    }
    
    func navToKartalarVC() {
        router.routeToKartalarVC()
    }
    
}
