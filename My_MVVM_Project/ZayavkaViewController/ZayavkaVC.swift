//
//  ZayavkaViewController.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 19/12/22.
//

import UIKit
protocol ZayavkaViewControllerLogic : ZayavkaViewInstaller {
    func setupTargets()
}
class ZayavkaViewController: UIViewController , ZayavkaViewControllerLogic {
    var container4: UIView!
    
    var textfield4: FloatingTextFieldView!
    
    var textfield1: FloatingTextFieldView!
    
    var container1: UIView!
    
    var textfield2: FloatingTextFieldView!
    
    var container2: UIView!
    
    var textfield3: FloatingTextFieldView!
    
    var container3: UIView!
    
    var submitBtn: UIButton!
    
    var multilineView: MaterialMultilineOutlinedView!
    
   
    
    var mainView: UIView! {self.view}
    var presenter : ZayavkaPresentationLogic?

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

}
