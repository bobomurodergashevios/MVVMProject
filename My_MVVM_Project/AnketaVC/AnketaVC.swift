//
//  AnketaVC.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 12/01/23.
//

import Foundation
import UIKit
protocol AnketaVCLogic : AnketaInstallerLogic {
    func setupTargets()
}
class AnketaVC : UIViewController , AnketaVCLogic {
    var cellArr : [AnketaTableViewCell] = []

    var tabView: UITableView!
    
    var mainView: UIView! {self.view}
    var presenter : AnketaPresenterLogic?
    var dateText: String = ""
    var dataList: [AnketaDM] = [
        AnketaDM(carNumber: "10A000AB", carName: "Chevrolet Nexia2 Donc V16", summa: "50000 sum", fullname: "Pahlavonov Qudrat1 Ismatovich"),
        AnketaDM(carNumber: "20A999AB", carName: "Chevrolet Cobalt Donc V16", summa: "62400 sum", fullname: "Pahlavonov Qudrat2 Ismatovich"),
        AnketaDM(carNumber: "30A899AB", carName: "Chevrolet Kombi Donc V16", summa: "56000 sum", fullname: "Pahlavonov Qudrat3 Ismatovich"),
        AnketaDM(carNumber: "40A899AB", carName: "Chevrolet Ford Donc V16", summa: "16000 sum", fullname: "Pahlavonov Qudrat4 Ismatovich"),
        AnketaDM(carNumber: "50A899AB", carName: "Chevrolet Matiz Donc V16", summa: "26000 sum", fullname: "Pahlavonov Qudrat5 Ismatovich"),
        AnketaDM(carNumber: "60A899AB", carName: "Chevrolet Damas Donc V16", summa: "46000 sum", fullname: "Pahlavonov Qudrat6 Ismatovich"),
        AnketaDM(carNumber: "70A899AB", carName: "Chevrolet Lacetti Donc V16", summa: "56000 sum", fullname: "Pahlavonov Qudrat7 Ismatovich"),
        AnketaDM(carNumber: "80A899AB", carName: "Chevrolet Tico Donc V16", summa: "65000 sum", fullname: "Pahlavonov Qudrat8 Ismatovich"),
        AnketaDM(carNumber: "90A779AB", carName: "Chevrolet Spark V16", summa: "51000 sum", fullname: "Pahlavonov Qudrat9 Ismatovich"),
        AnketaDM(carNumber: "70A009AB", carName: "Chevrolet Nexia1 Sons V15", summa: "32000 sum", fullname: "Obidov Shuhrat Utkirovich")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Anketalar"
        if #available(iOS 13.0, *) {
            self.navigationController?.navigationBar.standardAppearance = UINavigationBarAppearance()
            self.navigationController?.navigationBar.compactAppearance = UINavigationBarAppearance()
            self.navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
        }
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    func setupTargets() {
        tabView.register(AnketaTableViewCell.self, forCellReuseIdentifier: AnketaTableViewCell.identifier)
        tabView.delegate = self
        tabView.dataSource = self
        tabView.showsVerticalScrollIndicator = false
        
    }
}

extension AnketaVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AnketaTableViewCell.identifier, for: indexPath) as! AnketaTableViewCell
        cellArr.append(cell)
        cell.selectionStyle = .none
        cell.model = self.dataList[indexPath.row]
//        cell.datePickerBtn.addTarget(self, action: #selector(onBtnClicked(_:)), for: .touchUpInside)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = CalendarDialogController()
//                vc.completion = { text in
//                    self.cellArr[indexPath.row].datePickerLbl.text = text
//                }
//        self.navigationController?.present(vc, animated: true)
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    @objc func onBtnClicked(_ sender : UIButton){

        let vc = CalendarDialogController()
        vc.modalPresentationStyle = .popover
        vc.modalTransitionStyle = .crossDissolve

        vc.completion = { text in
            self.dateText = text
            self.tabView.reloadData()
        }



        self.navigationController?.present(vc, animated: true, completion: {

        })

    }

}
