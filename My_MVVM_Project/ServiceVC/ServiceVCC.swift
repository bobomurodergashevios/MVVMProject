//
//  ServicesViewController.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 21/12/22.
//

import UIKit

protocol ServicesViewControllerLogic : ServicesViewInstallerLogic{
    func setupTargets()
}
class ServicesViewController : UIViewController, ServicesViewControllerLogic {
  
    
    
    var tableview: UITableView!
    
    var mainView: UIView! {self.view}
    var presenter : ServicesViewPresenterLogic?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        title = "Product i uslugi"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupTargets() {
        tableview.register(ServicesTableViewCell.self, forCellReuseIdentifier: ServicesTableViewCell.identifier)
        
    }
}
