//
//  PaymentConfirmationInteractor.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 13/01/23.
//

import UIKit

protocol PaymentConfirmationBusinessLogic {
//    var payment: Payment {get}
//    var selectedPaymentCode: CPaymentCode? {get}
//    var paymentCodes: [CPaymentCode] {get}
//
//    func set(paymentCode: CPaymentCode)
//    func set(text: String, field: PaymentConfirmField)
//    func preparePaymentOrder(paymentRequest: PaymentRequest, completion: @escaping(String?) -> Void)
}

class PaymentConfirmationInteractor: PaymentConfirmationBusinessLogic {
    
//    var amount: String = ""
//    var amountText: String = ""
//    var sender: String = ""
//    var receiver: String = ""
//    var details: String = ""
//
//    var selectedPaymentCode: CPaymentCode? = nil
//    var paymentCodes: [CPaymentCode] = []
//
//    private let _payment: Payment
//    var payment: Payment {
//        _payment
//    }
//
//    init() {
////        self._payment = payment
////
////        self.amount = payment.amountText ?? ""
////        self.details = payment.details ?? ""
//    }
//
////    func set(paymentCode: CPaymentCode) {
////        self.selectedPaymentCode = paymentCode
////        //        self.paymentCodeSting = paymentCode.code
////    }
////
////    func set(text: String, field: PaymentConfirmField) {
////        switch field {
////
////        case .amount:
////            self.amount = text
////
////        case .details:
////            self.details = text
////
////        default:
////            break
////        }
////    }
//
//    func preparePaymentOrder(paymentRequest: PaymentRequest, completion: @escaping(String?) -> Void) {
//        //        guard let amount = Double(self.amount) else { return }
//        var requestData: [String:Any] = [:]
//        do {
//            let jsonData = try JSONEncoder().encode(paymentRequest)
//            requestData = try! JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as! [String:Any]
//        } catch {
//            print("error: \(error.localizedDescription)")
//        }
//
//        NetworkRequest.Payment().preparePaymentOrder(data: requestData) { result in
//            switch result {
//            case .success( _):
//                completion(nil)
//            case .failure(let appError):
//                completion(appError.localizedDescription)
//            }
//        }
//    }
}


