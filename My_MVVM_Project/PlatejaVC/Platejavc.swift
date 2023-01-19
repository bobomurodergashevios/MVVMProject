//
//  PLViewController.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 28/12/22.
//

import UIKit
protocol PLViewControllerLogic : PLVCInstallerLogic {
    func setupTargets()
}
class PLViewController: UIViewController , PLViewControllerLogic {
    var providenView: ProvedyonView!
    
    var mainView: UIView! {self.view}
    var presenter : PLVCPresenterLogic?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Платежи в национальной валюте"
        self.view.backgroundColor = UIColor(hex: "#F7F7F7")
        presenter?.viewDidLoad()
    }
    
    func setupTargets() {
        
    }

    

}
