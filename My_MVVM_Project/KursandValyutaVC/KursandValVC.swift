//
//  KursAndValyutaViewController.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 27/12/22.
//

import UIKit
protocol KursAndValyutaViewControllerLogic : KursAndValyutaViewInstallerLogic {
    func setupTargets()
}
class KursAndValyutaViewController : UIViewController, KursAndValyutaViewControllerLogic {
    var stackView: UIStackView!
    
    var segmentControl: UISegmentedControl!
    
    var tableview: UITableView!
    
    var mainView: UIView! {self.view}
    
    var presenter : KursAndValyutaViewPresenterLogic?
    
    override func viewDidLoad() {
        presenter?.viewDidLoad()
//        title = "Курсы валют"
        let rightButton = UIBarButtonItem(title: "Инфо", style: .plain, target: self, action: #selector(onRightBtnTapped))
        rightButton.tintColor = UIColor(hex: "#2AA65C")
        self.navigationItem.rightBarButtonItem = rightButton
        self.view.backgroundColor = .white
    }
    
    func setupTargets() {
        
    }
    
    @objc func onRightBtnTapped(){
        presenter?.navigate()
    }
}
