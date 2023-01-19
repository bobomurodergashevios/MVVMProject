//
//  ValyutaModel.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 27/12/22.
//

import UIKit
struct ValyutaModel {
   
    
    var logoImg : UIImage
    var valyutaName : String
    var dollarSsha : String?
    var prodaja : String?
    var pokupka : String?
    var prodajaValue : String
    var pokupkaValue : String
    
    
    init(logoImg: UIImage, valyutaName: String, dollarSsha: String? = nil, prodaja: String? = nil, pokupka: String? = nil, prodajaValue: String, pokupkaValue: String) {
        self.logoImg = logoImg
        self.valyutaName = valyutaName
        self.dollarSsha = "Доллар США"
        self.prodaja = "Продажа"
        self.pokupka = "Покупка"
        self.prodajaValue = prodajaValue
        self.pokupkaValue = pokupkaValue
    }
}
