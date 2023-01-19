//
//  IpotekaKartalarPresenter.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import UIKit

protocol IpotekaKartalarPresenterLogic : PresentationProtocol {
    func fetch0()
    func fetch1()
    func fetch2()

}
class IpotekaKartalarPresenter : IpotekaKartalarPresenterLogic {
   
    
    
    
    
    
    
    
    
    var view : IpotekaKartalarVCViewControllerLogic
    var interactor : IpotekaKartalarInteractorLogic
    var router : IpotekaKartalarRouterLogic
    var controller: IpotekaKartalarVCViewController { view as! IpotekaKartalarVCViewController }
    
    var array = [PageModel]()
    var tableData1 = [PageCellModel]()
    var tableData2 = [PageCellModel]()
    var tableData3 = [PageCellModel]()

    init(view: IpotekaKartalarVCViewControllerLogic, interactor: IpotekaKartalarInteractorLogic, router: IpotekaKartalarRouterLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view.setupSubviews()
        view.setupTargets()
        self.array = interactor.fetchAllPageModels()
        for x in 0 ... 2 {
            view.page = PageView(frame: CGRect(x: CGFloat(x) * view.mainView.frame.width, y: 0, width: view.mainView.frame.width, height: 210))
            view.page.backgroundColor = .clear
            view.page.model = array[x]
            view.segmentTableView.reloadData()
            view.page.addBorder(side: .bottom, color: .gray, width: 0.5)
            view.page.addBorder(side: .top, color: .gray, width: 0.2)
            view.scrollVieww.addSubview(view.page)
        }
        controller.datalist1 = interactor.datList0()
        controller.datalist2 = interactor.datList1()
        controller.datalist3 = interactor.datList2()
        
    }
    
    func fetch0() {
        self.tableData1 = interactor.datList0()
    }
    
    func fetch1() {
        self.tableData2 = interactor.datList1()
    }
    
    func fetch2() {
        self.tableData3 = interactor.datList2()
    }
}
