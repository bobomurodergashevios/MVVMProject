//
//  HisobraqamlarViewController.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 10/01/23.
//

import UIKit
protocol HisobraqamlarViewControllerLogic : HisobraqamlarViewInstallerLogic{
    func setupTargets()
}
class HisobraqamlarViewController : UIViewController,HisobraqamlarViewControllerLogic {
    var scrollView: UIScrollView!
    
    var refreshControl: UIRefreshControl!
    
    var stackView: UIStackView!
    
    var cardVV: CardViewww!
    
    var mainView: UIView! {self.view}
    var presenter : HisobraqamlarViewPresenterLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hex: "#F7F7F7")
        presenter?.viewDidLoad()
    }
    

    func setupTargets() {
        
    }
}
