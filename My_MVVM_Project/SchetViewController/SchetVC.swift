//
//  SchetVC.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 20/01/23.
//

import UIKit

protocol SchetVCLogic : SchetVCInstaller{
    func setupTargets()
}
class SchetViewController : UIViewController , SchetVCLogic {
    var balanceView: BalanceView!
    var schetCardView: SchetCardView!
    var dataView: RequiredDataView!
    var tableview: UITableView!
    var refControl = UIRefreshControl(frame: .zero)
    var presenter : SchetVCPresenter?
    var mainView: UIView! { self.view }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Счет"
        self.view.backgroundColor = UIColor(hex: "#F7F7F7")
//            .foregroundColor: UIColor.black,.font: normalFont
        let rightBarBtn = UIBarButtonItem(title: "Инфо", style: .done, target: self, action: #selector(onInfoBtnClicked(_:)))
        rightBarBtn.setTitleTextAttributes([.font : UIFont.systemFont(ofSize: 14),.foregroundColor : UIColor.green], for: .normal)
        self.navigationItem.rightBarButtonItem = rightBarBtn

        presenter?.viewDidLoad()
        
        refControl = UIRefreshControl(frame: .zero)
        refControl.beginRefreshing()
        tableview.refreshControl = refControl
      
       
    }
    func setupTargets() {
        dataView.dataBtn.addTarget(self, action: #selector(onDataBtnTap(_:)), for: .touchUpInside)
        refControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
//        dataView.
    }
    @objc func onInfoBtnClicked(_ sender : UIButton){
        print("Info Button")
    }
    @objc func onDataBtnTap(_ sender : UIButton){
        print("data Button")
        presenter?.presentToDialog()
    }
    @objc func refresh()
    {
        // Updating your data here...

        
        
    }
    
    
}
