//
//  PageModel.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import UIKit

struct PageModel {
    
    
    let cardImg : UIImage?
    let cardTitle : String?
    let cardBalance : String?
    
    init(cardImg: UIImage? = nil, cardTitle: String? = nil, cardBalance: String? = nil) {
        self.cardImg = cardImg
        self.cardTitle = cardTitle
        self.cardBalance = cardBalance
    }
    
    
}
