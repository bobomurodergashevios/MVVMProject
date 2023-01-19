//
//  SettingVCPresenter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 22/12/22.
//

import Foundation
import UIKit

protocol SettingVCPresenterLogic : PresentationProtocol {
    
}

class SettingVCPresenter : NSObject, SettingVCPresenterLogic {
   
    
    
    var view : SettingVCLogic
    var interactor : SettingVCInteractorLogic
    var router : SettingVCRouterLogic
    
    var data = [
         OrdersDataModel(img: UIImage(named: "menu_products") ?? UIImage(), title: "Продукты и услуги"),
         OrdersDataModel(img: UIImage(named: "menu_phone") ?? UIImage(), title: "Связаться с банком"),
         OrdersDataModel(img: UIImage(named: "menu_info") ?? UIImage(), title: "Tenge info"),
         OrdersDataModel(img: UIImage(named: "menu_cabinet") ?? UIImage(), title: "Личный кабинет"),
         OrdersDataModel(img: UIImage(named: "menu_settings") ?? UIImage(), title: "Настройки"),
     ]
    
    init(view: SettingVCLogic, interactor: SettingVCInteractorLogic, router: SettingVCRouterLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view.setupSubviews()
        view.setupTargets()
      
        view.standartOrders.tableview.delegate = self
        view.standartOrders.tableview.dataSource = self
    }
}

extension SettingVCPresenter :UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value2, reuseIdentifier: "UITableViewCell")
        cell.selectionStyle = .none
//        cell.contentView.backgroundColor = .red
        var imageview:UIImageView=UIImageView(frame: CGRect(x: 5, y: 5, width: 50, height: 50))
        imageview.contentMode = .scaleAspectFit
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 10
        let img : UIImage = data[indexPath.row].img
        imageview.image = img
        cell.contentView.addSubview(imageview)
        let lbl = UILabel(frame: CGRect(x: imageview.frame.maxX+15, y: 10, width: 200, height: 30))
        lbl.text = data[indexPath.row].title
        cell.contentView.addSubview(lbl)
        return cell
    }
    
   
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Стандартные заявки"
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let lbl = UILabel()
        lbl.text = "Стандартные заявки"
        lbl.font = .systemFont(ofSize: 18)
        return lbl
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            self.router.navigationLichniyKabinet()
        }else{
            self.router.presetnVC()
        }
        
    }
}
