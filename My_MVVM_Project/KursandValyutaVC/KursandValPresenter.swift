//
//  KursAndValyutaViewPresenter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 27/12/22.
//

import UIKit
protocol KursAndValyutaViewPresenterLogic : PresentationProtocol {
    func navigate()
}
class KursAndValyutaViewPresenter : NSObject, KursAndValyutaViewPresenterLogic {
    
    
    
    var view : KursAndValyutaViewControllerLogic
    var interactor : KursAndValyutaViewInteractorLogic
    var router : KursAndValyutaViewRouterLogic
    
    
    init(view: KursAndValyutaViewControllerLogic, interactor: KursAndValyutaViewInteractorLogic, router: KursAndValyutaViewRouterLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    var dataList0 = [
        ValyutaModel(logoImg: UIImage(named: "USD_F") ?? UIImage(), valyutaName: "USD", prodajaValue: "10 750 сум", pokupkaValue: "10 700 сум"),
        ValyutaModel(logoImg: UIImage(named: "EUR_F") ?? UIImage(), valyutaName: "EUR", prodajaValue: "15 750 сум", pokupkaValue: "16 700 сум"),
        ValyutaModel(logoImg: UIImage(named: "KZT_F") ?? UIImage(), valyutaName: "KZT", prodajaValue: "10 750 сум", pokupkaValue: "10 700 сум"),
        ValyutaModel(logoImg: UIImage(named: "RUB_F") ?? UIImage(), valyutaName: "RUB", prodajaValue: "10 750 сум", pokupkaValue: "10 700 сум"),
        ValyutaModel(logoImg: UIImage(named: "USD_F") ?? UIImage(), valyutaName: "FUNT", prodajaValue: "10 750 сум", pokupkaValue: "10 700 сум"),
        ValyutaModel(logoImg: UIImage(named: "GBP_F") ?? UIImage(), valyutaName: "UZS", prodajaValue: "10 750 сум", pokupkaValue: "10 700 сум"),
    ]
    var dataList1 = [
        ValyutaModel(logoImg: UIImage(named: "USD_F") ?? UIImage(), valyutaName: "USD", prodajaValue: "10 750 сум", pokupkaValue: "10 700 сум"),
        ValyutaModel(logoImg: UIImage(named: "EUR_F") ?? UIImage(), valyutaName: "EUR", prodajaValue: "15 750 сум", pokupkaValue: "16 700 сум"),
        ValyutaModel(logoImg: UIImage(named: "KZT_F") ?? UIImage(), valyutaName: "KZT", prodajaValue: "10 750 сум", pokupkaValue: "10 700 сум"),
    ]
    var dataList2 = [
        ValyutaModel(logoImg: UIImage(named: "KZT_F") ?? UIImage(), valyutaName: "KZT", prodajaValue: "10 750 сум", pokupkaValue: "10 700 сум"),
        ValyutaModel(logoImg: UIImage(named: "RUB_F") ?? UIImage(), valyutaName: "RUB", prodajaValue: "10 750 сум", pokupkaValue: "10 700 сум"),
        ValyutaModel(logoImg: UIImage(named: "USD_F") ?? UIImage(), valyutaName: "FUNT", prodajaValue: "10 750 сум", pokupkaValue: "10 700 сум"),
        ValyutaModel(logoImg: UIImage(named: "GBP_F") ?? UIImage(), valyutaName: "UZS", prodajaValue: "10 750 сум", pokupkaValue: "10 700 сум"),
    ]
    var dataArray = [ValyutaModel]()
    
    func viewDidLoad() {
        view.setupTargets()
        view.setupSubviews()
        dataArray = dataList0
        view.tableview.register(ValyutaTableViewCell.self, forCellReuseIdentifier: ValyutaTableViewCell.identifier)
        view.tableview.delegate = self
        view.tableview.dataSource = self
        view.segmentControl.addTarget(self, action: #selector(handleSegmentChange(_:)), for: .valueChanged)
    }
    
    @objc func handleSegmentChange(_ sender : UISegmentedControl){
        
        if #available(iOS 13.0, *) {
            sender.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for:
                    .selected)
        } else {
            // Fallback on earlier versions
        }
        print(sender.selectedSegmentIndex)
        if sender.selectedSegmentIndex == 1 {
            dataArray = dataList1
            view.tableview.reloadData()
        }else if sender.selectedSegmentIndex == 2 {
            dataArray = dataList2
            view.tableview.reloadData()
        }else {
            dataArray = dataList0
            view.tableview.reloadData()
        }
    }
    
    func navigate() {
        self.router.presentVC()
    }
    
}
extension KursAndValyutaViewPresenter : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ValyutaTableViewCell.identifier, for: indexPath) as! ValyutaTableViewCell
        cell.backgroundColor = UIColor(hex: "#F7F7F7")
        cell.selectionStyle = .none
        cell.model = dataArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
