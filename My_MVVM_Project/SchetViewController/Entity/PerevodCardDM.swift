//
//  PerevodCardDM.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 20/01/23.
//

import UIKit
struct PerevodCardDM {
    
    
    let cardNumber : String?
    let cardBalance : String?
    let data : String?
    
    
    init(cardNumber: String? = nil, cardBalance: String? = nil, data: String? = nil) {
        self.cardNumber = cardNumber
        self.cardBalance = cardBalance
        self.data = data
        
    }
    
}

