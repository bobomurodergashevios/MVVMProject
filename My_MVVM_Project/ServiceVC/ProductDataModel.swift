//
//  ProductDataModel.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 21/12/22.
//

import UIKit

struct ProductDataModel {
    var img : UIImage?
    var boldTitle : String
    var mediumTitle : String
    var moreBtnTitle : String?
    var openBtnTitle : String?
    var mode : Mode
    init(img: UIImage, boldTitle: String, mediumTitle: String, moreBtnTitle: String? = "Uznat podrobnoe", openBtnTitle: String? = "Otkirit", mode: Mode = .simple) {
        self.img = img
        self.boldTitle = boldTitle
        self.mediumTitle = mediumTitle
        self.moreBtnTitle = moreBtnTitle
        self.openBtnTitle = openBtnTitle
        self.mode = mode
    }
    
    enum Mode {
        case simple
        case other
        
        
        
    }
}
