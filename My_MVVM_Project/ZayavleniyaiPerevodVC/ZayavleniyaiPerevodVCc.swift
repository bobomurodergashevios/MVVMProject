//
//  ZayavleniyaVC.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 26/12/22.
//

import UIKit
protocol ZayavleniyaVCLogic : ZayavleniyaVCInstallerLogic {
    func setupTargets()
}

class ZayavleniyaVC : UIViewController , ZayavleniyaVCLogic {
    var tableview: UITableView!
    
    var indLbl: UILabel!
    
    var indTextFieldContainer: UIView!
    
    var indTextField: FloatingTextFieldView!
    
    var mainView: UIView! {self.view}
    var presenter : ZayavleniyaVCPresenterLogic?
    
    override func viewDidLoad() {
        presenter?.viewDidLoad()
        self.view.backgroundColor = UIColor(hex: "F7F7F7")
        title = "Заявление на перевод валюты"
    }
    func setupTargets() {
//        tableview.reloadData()
       
    }
}
