

import Foundation
import UIKit

protocol SettingVCLogic : SettingVCInstallerLogic {
    func setupTargets()

}
class SettingVC : UIViewController,SettingVCLogic {
    var standartOrders: StandartOrdersView!
    var container: UIView!
    var homeHeaderView: HomeHeaderView!
    
    
    
    var presenter : SettingVCPresenterLogic?
    var mainView: UIView! {self.view}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainView.backgroundColor = .white
//        setupTargets()
        self.navigationController?.isNavigationBarHidden = true
        presenter?.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setupTargets() {
        
    }
}
