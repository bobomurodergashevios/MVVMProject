//
//  IpotekaKartalarInteractor.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import UIKit
protocol IpotekaKartalarInteractorLogic {
    func fetchAllPageModels() -> [PageModel]
    func datList0() -> [PageCellModel]
    func datList1() -> [PageCellModel]
    func datList2() -> [PageCellModel]

}
class IpotekaKartalarInteractor : IpotekaKartalarInteractorLogic {
    func datList0() -> [PageCellModel] {
        let arr = [
            PageCellModel(title: "Karta mahsuloti",status: "UzCard"),
            PageCellModel(title: "Karta turi",status: "uzcard card salary".uppercased()),
            PageCellModel(title: "Mavjud chegara",status: "419.16 UZS"),
            PageCellModel(title: "Kartadagi mablag",status: "419.16 UZS"),
            PageCellModel(title: "Karta hisobi",status: "226540034433231465902"),
            PageCellModel(title: "Karta raqami",status: "8600130989887833"),
            PageCellModel(title: "Turkum",status: "Debit"),
            PageCellModel(title: "Karta turi",status: "Asosiy"),
            PageCellModel(title: "Holat",status: "Faol"),
            PageCellModel(title: "Karta egasi",status: "Ergashev.B.N"),
            PageCellModel(title: "Kartadagi ism",status: "Ergashev Bobomurod"),
            PageCellModel(title: "Qo'shimcha kartalar",status: "Yo'qolgan"),

        ]
        return arr
    }
    
    func datList1() -> [PageCellModel] {
        let arr = [
            PageCellModel(title: "Karta mahsuloti1",status: "Humo"),
            PageCellModel(title: "Karta turi1",status: "uzcard card salary1".uppercased()),
            PageCellModel(title: "Mavjud chegara1",status: "419.16 UZS"),
            PageCellModel(title: "Kartadagi mablag1",status: "419.16 UZS"),
            PageCellModel(title: "Karta hisobi1",status: "226540034433231465902"),
            PageCellModel(title: "Karta raqami1",status: "9860348934922322"),
            PageCellModel(title: "Turkum1",status: "Debit1"),
            PageCellModel(title: "Karta turi1",status: "Asosiy1"),
            PageCellModel(title: "Holat1",status: "Faol"),
            PageCellModel(title: "Karta egasi1",status: "Ergashev.B.N1"),
            PageCellModel(title: "Kartadagi ism1",status: "Ergashev Bobomurod1"),
            PageCellModel(title: "Qo'shimcha kartalar1",status: "Yo'qolgan1"),

        ]
        return arr
    }
    
    func datList2() -> [PageCellModel] {
        let arr = [
            PageCellModel(title: "Karta mahsuloti2",status: "UzCard2"),
            PageCellModel(title: "Karta turi2",status: "uzcard card salary2".uppercased()),
            PageCellModel(title: "Mavjud chegara2",status: "419.16 UZS2"),
            PageCellModel(title: "Kartadagi mablag2",status: "419.16 UZS2"),
            PageCellModel(title: "Karta hisobi2",status: "37823872837782387223"),
            PageCellModel(title: "Karta raqami2",status: "9860389237437222"),
            PageCellModel(title: "Turkum2",status: "Debit2"),
            PageCellModel(title: "Karta turi2",status: "Asosiy2"),
            PageCellModel(title: "Holat2",status: "Faol2"),
            PageCellModel(title: "Karta egasi2",status: "Ergashev.B.N2"),
            PageCellModel(title: "Kartadagi ism2",status: "Ergashev Bobomurod2"),
            PageCellModel(title: "Qo'shimcha kartalar2",status: "Yo'qolgan2"),

        ]
        return arr
    }
    
 
    
    func fetchAllPageModels() -> [PageModel] {
        var resultArray : [PageModel] = [
            PageModel(cardImg: UIImage(named: "Uzcard"),cardTitle: "UZCARD CARD SALARY",cardBalance: "419.16 UZS"),
            PageModel(cardImg: UIImage(named: "humo"),cardTitle: "HUMO CARD SALARY",cardBalance: "132.65 UZS"),
            PageModel(cardImg: UIImage(named: "Uzcard"),cardTitle: "UZCARD CARD SALARY",cardBalance: "999.09 UZS")
        ]
        return resultArray
    }
    
    
}
