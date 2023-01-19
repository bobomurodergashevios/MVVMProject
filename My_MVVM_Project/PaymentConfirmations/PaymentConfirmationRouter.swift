//
//  PaymentConfirmationRouter.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 13/01/23.
//

import UIKit

//PaymentConfirmationRoutingLogic
protocol PaymentConfirmationRoutingLogic {
//    func navigateToSuccessVC(amountLabel: String?)
//    func navigateToSuccessEdit()
}


class PaymentConfirmationRouter: BaseRouter, PaymentConfirmationRoutingLogic {
    
//
//    init(payment: Payment, paymentType: PaymentType) {
//        let controller = PaymentConfirmationViewController()
//        super.init(viewController: controller)
//
//        let interactor = PaymentConfirmationInteractor()
//        let presenter = PaymentConfirmationPresenter(view: controller, interactor: interactor, router: self, paymentType: paymentType, payment: payment)
//        controller.presenter = presenter
//    }
//
    public static func createModule() -> UIViewController {
        let controller = PaymentConfirmationViewController()
        let router = PaymentConfirmationRouter(viewController: controller)
        let interactor = PaymentConfirmationInteractor()
        let presenter = PaymentConfirmationPresenter(view: controller, interactor: interactor, router: router)
        controller.presenter = presenter
        return controller
    }
    
//    func navigateToSuccessVC(amountLabel: String?) {
//        appRouter.push(SuccessOrPendingRouter(message: "Платеж успешно создан", amountLabel: amountLabel, mode: .success))
//    }
//
//    func navigateToSuccessEdit() {
//        appRouter.push(SuccessRouter(message: "Изменения успешно сохранены!"))
//    }
    
}

