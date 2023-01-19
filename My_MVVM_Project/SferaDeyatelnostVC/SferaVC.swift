//
//  VC.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import Foundation
import UIKit

protocol SferaDeyatelnostViewControllerLogic : SferaDeyatelnostViewInstalller {
    func setupTargets()
}

class SferaDeyatelnostViewController: UIViewController,SferaDeyatelnostViewControllerLogic {
    var plusBtn: UIButton!
    
    var lbl: UILabel!
    
    var adressShowlbl: UILabel!
    
    
    
    
    var container: UIView!
    
    var textView: FloatingTextFieldView!
    
    
    var mainView: UIView! {self.view}
    
    var presenter : SferaDeyatelnostViewPresenterProtocol?
    
    
    var submitBtn: UIButton!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        presenter?.viewDidLoad()
//        self.navigationItem.titleView = TitleView(frame: CGRect(x: 20, y: 0, width: mainView.bounds.width-40, height: 100),title: "Заявки на размещение депозита")
        self.navigationItem.titleView?.backgroundColor = .white
    }
    

    func setupTargets() {
        
    }

}
