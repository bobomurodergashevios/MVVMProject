//
//  PaymentConfirmationPresenter.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 13/01/23.
//

import UIKit

protocol PaymentConfirmationPresentationLogic: PresentationProtocol {
}

class PaymentConfirmationPresenter: PaymentConfirmationPresentationLogic {
    
    private unowned let view: PaymentConfirmationDisplayLogic
    private var interactor: PaymentConfirmationBusinessLogic
    private let router: PaymentConfirmationRoutingLogic
    
    private var controller: PaymentConfirmationViewController { view as! PaymentConfirmationViewController }
//    private var showingPaymentCodesInProgress = false
    
//    var paymentType: PaymentType?
//    var hash: String?
//    var paymentID: CPayment.PaymentType?
//    private let payment: Payment
    
    
    init(view: PaymentConfirmationDisplayLogic, interactor: PaymentConfirmationBusinessLogic, router: PaymentConfirmationRoutingLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        
        view.setupSubviews()
        view.setupTargets()
//        if !hash.isNilOrEmpty {
//            self.controller.title = paymentID?.title
//        } else {
//            self.controller.title = paymentType?.name
//        }
    }
    
    func viewWillAppear(_ animated: Bool) {
//        appRouter.makeStatusBar(.default)
//        appRouter.showNavBar(controller.navigationItem, style: .blue)
    }
    

    
}
