//
//  NextViewC.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import UIKit
protocol NextViewControllerLogic : NextVCInstaller {
    func setupTargets()
}
class NextViewController: UIViewController, NextViewControllerLogic {
    var containerTable: UIView!
    var buttonView: UIView!
    var tableview: UITableView!
    var gradientLayer: CAGradientLayer!
    var btn: UIButton!
    
    var mainView: UIView! {self.view}
    var presenter : NextVCPresenterLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"
        presenter?.viewDidLoad()
    }
    
    func setupTargets() {
        
    }
    
    
    
}
