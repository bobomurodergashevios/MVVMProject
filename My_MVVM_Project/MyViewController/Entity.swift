//
//  Entity.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//


import Foundation

import UIKit

struct KursValyutaDM {
    var isUsd : Bool = true
    var usdNameLbl : String
    var setUsd : String
    var getUsd : String
    var kursImage : UIImage?
    init(isUsd: Bool, usdNameLbl: String, setUsd: String, getUsd: String, kursImage: UIImage? = nil) {
        self.kursImage = self.isUsd ? UIImage(named: "USD") : UIImage(named: "EUR")
        self.usdNameLbl = usdNameLbl
        self.setUsd = setUsd
        self.getUsd = getUsd
    }
}
