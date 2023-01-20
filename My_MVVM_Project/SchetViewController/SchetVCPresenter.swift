//
//  SchetVCPresenter.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 20/01/23.
//

import UIKit

protocol SchetVCPresenterLogic : PresentationProtocol {
    func presentToDialog()
}
class SchetVCPresenter : NSObject , SchetVCPresenterLogic {
    
    var view : SchetVCLogic
    var interactor : SchetVCInteractorLogic
    var router : SchetVCRouterLogic
    var controller : SchetViewController {view as! SchetViewController}
    
//    var data1Text : String?
//    var data2Text : String?
    
    init(view: SchetVCLogic, interactor: SchetVCInteractorLogic, router: SchetVCRouterLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    
    func viewDidLoad() {
        view.setupSubviews()
        view.setupTargets()
        
        view.tableview.register(PerevodCardViewCell.self, forCellReuseIdentifier: "PerevodCardViewCell")
        view.tableview.delegate = self
        view.tableview.dataSource = self
        
        
    }
    
    
    func presentToDialog() {
        let vc = SelectedDataDialog()
        controller.navigationController?.present(vc, animated: true)
        vc.dataChanged = { txt1 , txt2 in
            self.controller.dataView.data1Lbl.text = txt1
            self.controller.dataView.data2Lbl.text = txt2
        }
    }
}
extension SchetVCPresenter : UITableViewDelegate,UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PerevodCardViewCell", for: indexPath) as! PerevodCardViewCell
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
