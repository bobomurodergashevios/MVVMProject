//
//  NextVCPresenter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 23/12/22.
//

import UIKit

protocol NextVCPresenterLogic : PresentationProtocol {
    
}
class NextVCPresenter : NSObject , NextVCPresenterLogic {
    
    var view : NextViewControllerLogic
    var interactor : NextVCInteractorLogic
    var router : NextVCRouterLogic
    let data = [
        OrdersDataModel(img: UIImage(named: "budget_icon") ?? UIImage(), title: "Язык"),
        OrdersDataModel(img: UIImage(named: "budget_income") ?? UIImage(), title: "Push-уведомления")
    ]
    init(view: NextViewControllerLogic, interactor: NextVCInteractorLogic, router: NextVCRouterLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    func viewDidLoad() {
        view.setupTargets()
        view.setupSubviews()
        view.tableview.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        view.tableview.delegate = self
        view.tableview.dataSource = self
    }
}
extension NextVCPresenter : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.selectionStyle = .none
//        cell.contentView.backgroundColor = .red
        var imageview:UIImageView=UIImageView(frame: CGRect(x: 5, y: 10, width: 50, height: 50))
        imageview.contentMode = .scaleAspectFit
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = 10
        let img : UIImage = data[indexPath.row].img
        imageview.image = img
        cell.contentView.addSubview(imageview)
        let lbl = UILabel(frame: CGRect(x: imageview.frame.maxX+15, y: 15, width: 200, height: 30))
        lbl.text = data[indexPath.row].title
        cell.contentView.addSubview(lbl)
        let switchch = UISwitch()
        switchch.isOn = true
        if indexPath.row == 1 {
            cell.accessoryView = switchch
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        75
    }
    
   
}
