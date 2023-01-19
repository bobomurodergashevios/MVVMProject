//
//  CardModel.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 26/12/22.
//

import Foundation
import UIKit

struct CardModel {
    var amount : String
    var data : String
    var schetaNumber : String
    var companyName : String
    var accountNumber : String
    
    init(amount: String, data: String, schetaNumber: String, companyName: String, accountNumber: String) {
        self.amount = amount
        self.data = data
        self.schetaNumber = schetaNumber
        self.companyName = companyName
        self.accountNumber = accountNumber
    }
}
