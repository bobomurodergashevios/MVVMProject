//
//  RekvizitVCC.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import Foundation
import UIKit

protocol RekvizitViewControllerLogic : RekvizitViewInstaller {
    func setupTargets()
}

class RekvizitViewController: UIViewController , RekvizitViewControllerLogic {
    var titleLbl: UILabel!
    
    var container5: UIView!
    
    var textfield5: FloatingTextFieldView!
    
    var container4: UIView!
    
    var textfield4: MaterialMultilineOutlinedView!
    
    var textfield1: FloatingTextFieldView!
    
    var container1: UIView!
    
    var textfield2: FloatingTextFieldView!
    
    var container2: UIView!
    
    var textfield3: FloatingTextFieldView!
    
    var container3: UIView!
    
    var submitBtn: UIButton!
    
    var multilineView: MaterialMultilineOutlinedView!
    
   
    
    var mainView: UIView! {self.view}
    var presenter : RekvizitViewPresenterLogic?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
//        self.navigationController?.navigationBar.isHidden = false

//        self.navigationItem.titleView = TitleView(frame: CGRect(x: 20, y: 0, width: mainView.bounds.width-40, height: 100),title : "Заявки на размещение депозита")
        title = "Заявки на размещение депозита"
        self.navigationItem.titleView?.backgroundColor = .white
        view.backgroundColor = .white
    }
    

    func setupTargets() {
        
        
    }

   
    @objc func ontap(){
        print("Fs")
    }
}

