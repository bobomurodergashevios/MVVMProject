//
//  ZayavleniyaVCPresenter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 26/12/22.
//

import UIKit
protocol ZayavleniyaVCPresenterLogic : PresentationProtocol {

}

class ZayavleniyaVCPresenter : NSObject , ZayavleniyaVCPresenterLogic {
   
    
    var view : ZayavleniyaVCLogic
    var interactor : ZayavleniyaVCInteractorLogic
    var router : ZayavleniyaVCRouterLogic
    
    var dataList = [
        CardModel(amount: "49 298,09 USD", data: "05.09.2022", schetaNumber: "7888 2372 2322 4555 0417 0200 003", companyName: "ARTEL GROUP Co. Ltd", accountNumber: "999 333 734 907"),
        CardModel(amount: "18 348,39 USD", data: "08.10.2022", schetaNumber: "2072 9797 3395 8927 0417 0200 002", companyName: "SHIELONG LOGISTICS Co. Ltd", accountNumber: "876 444 467 432"),
        CardModel(amount: "44 255,22 USD", data: "11.01.2022", schetaNumber: "7272 2323 2387 9992 0417 0200 021", companyName: "UZ AUTO MOTORS Co. Ltd", accountNumber: "675 232 775 765"),
        CardModel(amount: "40 208,90 USD", data: "02.02.2022", schetaNumber: "2345 2323 8735 9087 0417 7272 004", companyName: "UZRAILWAYS Co. Ltd", accountNumber: "555 234 546 544"),
        CardModel(amount: "23 294,78 USD", data: "04.12.2022", schetaNumber: "7826 7327 3762 3267 0417 0200 222", companyName: "QATAR AIRWAYS (JIANGSU) Co. Ltd", accountNumber: "243 556 234 234"),
        CardModel(amount: "67 348,63 USD", data: "06.05.2022", schetaNumber: "1289 7823 6776 8970 0417 0200 003", companyName: "AIRBUS (UAE) Co. Ltd", accountNumber: "234 654 432 233"),
    ]
    
    var newDataList : [CardModel] = [CardModel]()
    init(view: ZayavleniyaVCLogic, interactor: ZayavleniyaVCInteractorLogic, router: ZayavleniyaVCRouterLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
        newDataList = dataList
    }
    func viewDidLoad() {
        view.setupTargets()
        view.setupSubviews()
        view.tableview.showsVerticalScrollIndicator = false
        view.tableview.register(ZayavleniyaCardViewCell.self, forCellReuseIdentifier: ZayavleniyaCardViewCell.identifier)
        view.tableview.delegate = self
        view.tableview.dataSource = self
        
        view.indTextField.didChangeTextCallback = { text in
            guard let text = text else{ return }
            if text.count > 3 {
                self.newDataList.removeAll()
                self.view.tableview.reloadData()
                for item in self.dataList {
                    let txt = item.schetaNumber.withoutWhiteSpace
                    let txt2 = item.data
                    if txt.hasPrefix(text) || txt.contains(text) || txt2.hasPrefix(text) || txt2.contains(text) {
                            self.newDataList.append(item)
                            self.view.tableview.reloadData()
                    }
                }
            }else{
                self.newDataList = self.dataList
                self.view.tableview.reloadData()
            }
        }
    }
    
}

extension ZayavleniyaVCPresenter : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newDataList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ZayavleniyaCardViewCell.identifier, for: indexPath) as! ZayavleniyaCardViewCell
        cell.backgroundColor = UIColor(hex: "#F7F7F7")
        cell.selectionStyle = .none
        cell.model = newDataList.isEmpty ? dataList[indexPath.row] : newDataList[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
        
    }
    
}


