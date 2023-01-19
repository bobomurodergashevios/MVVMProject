//
//  ServicesViewPresenter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 21/12/22.
//

import UIKit

protocol ServicesViewPresenterLogic : PresentationProtocol {
    func pushVC(_ tag : Int?)
}

class ServicesViewPresenter : NSObject, ServicesViewPresenterLogic {
    
    
    var view : ServicesViewControllerLogic
    var interactor : ServicesViewInteractorLogic
    var router : ServicesViewRouterLogic
    
    
    
    let datalist = [
        ProductDataModel(img: UIImage(named: "ph") ?? UIImage(), boldTitle: "Обслуживание счета", mediumTitle: "Транзакционное обслуживание"),
        ProductDataModel(img: UIImage(named: "halyk_transfer_homebank_inside_1125x2001") ?? UIImage(), boldTitle: "Эквайринг", mediumTitle: "POS - Терминалы"),
        ProductDataModel(img: UIImage(named: "halyk_sulpak_homebank_inside_1125x2001") ?? UIImage(), boldTitle: "Кредитование", mediumTitle: "На бизнес цели,На инвестиционные цели"),
        ProductDataModel(img: UIImage(named: "halyk_push_homebank_inside_1125x2001") ?? UIImage(), boldTitle: "Залоговое имущество", mediumTitle: "непрофильные активы, залоговое, арестованное и конфискованное имущество"),
        ProductDataModel(img: UIImage(named: "ph") ?? UIImage(), boldTitle: "Торговое финансирование", mediumTitle: "Гарантии , Аккредитивы"),
        ProductDataModel(img: UIImage(named: "halyk_transfer_homebank_inside_1125x2001") ?? UIImage(), boldTitle: "Зарплатный проект", mediumTitle: "Банковская услуга для предприятий и ИП по автоматическому зачислению заработной и других выплат"),
        ProductDataModel(img: UIImage(named: "halyk_sulpak_homebank_inside_1125x2001") ?? UIImage(), boldTitle: "Продукты казначейства", mediumTitle: "Депозиты , Конверсионные операции"),
    ]
    
    init(view: ServicesViewControllerLogic!, interactor: ServicesViewInteractorLogic!, router: ServicesViewRouterLogic!) {
            self.view = view
            self.interactor = interactor
            self.router = router
    }
    func viewDidLoad() {
        view.setupSubviews()
        view.setupTargets()
        view.tableview.delegate = self
        view.tableview.dataSource = self
        
    }
    
    
    func pushVC(_ tag : Int?) {
        if tag == 0 {
            self.router.pushvc()
        }
        if tag == 1 {
            self.router.pushOtkritBtnTapped()
        }
        if tag == 2 {
            self.router.pushMoreBtnTapped()
        }
    }
}

extension ServicesViewPresenter : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datalist.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ServicesTableViewCell.identifier, for: indexPath) as! ServicesTableViewCell
        cell.listData = datalist[indexPath.row]
        cell.selectionStyle = .none
        cell.moreButtonClicked = { action in
            print(action)
            self.pushVC(1)
        }
        cell.openButtonClicked = { action in
            print(action)
            self.pushVC(2)
        }
//        cell.openBtn.addTarget(self, action: #selector(onbnt), for: .touchUpInside)
//        cell.moreBtn.addTarget(self, action: #selector(onBTN), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.pushVC(0)
    }
//    @objc func onbnt(){
//        self.pushVC(1)
//    }
//    @objc func onBTN(){
//        self.pushVC(2)
//    }
}
