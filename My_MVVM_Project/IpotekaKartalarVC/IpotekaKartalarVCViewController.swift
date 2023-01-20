//
//  IpotekaKartalarVCViewController.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import UIKit
protocol IpotekaKartalarVCViewControllerLogic : IpotekaKartalarInstaller{
    func setupTargets()
}
class IpotekaKartalarVCViewController: UIViewController , IpotekaKartalarVCViewControllerLogic {
    
    var scrollVieww: UIScrollView!
    
    var pageControll: UIPageControl!
    
    var page: PageView!
    var btn1: UIButton!
    var btn2: UIButton!
    var btn3: UIButton!
    

    var segmentControll: UISegmentedControl!
    var segmentTableView: UITableView!
    var segmentWrapperStackView: UIStackView!
    
    var mainView: UIView! {self.view}
    var presenter : IpotekaKartalarPresenterLogic!
    
    
    
    var dataList = [PageCellModel]()
    var datalist1 = [PageCellModel]()
    var datalist2 = [PageCellModel]()
    var datalist3 = [PageCellModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        self.view.backgroundColor = UIColor(hex: "#F7F7F7")
        dataList = datalist1
        print(dataList.count)
        title = "Kartalar"
    }
    
    
    
    func setupTargets() {
        pageControll.addTarget(self, action: #selector(pageControllDidchange(_:)), for: .valueChanged)
        scrollVieww.delegate = self
        
        segmentTableView.register(AboutCardCell.self, forCellReuseIdentifier: AboutCardCell.identifier)
        segmentTableView.delegate = self
        segmentTableView.dataSource = self
        segmentTableView.separatorStyle = .none
//        segmentTableView.backgroundColor = .red
        segmentControll.addTarget(self, action: #selector(onHandleSegmented(_:)), for: .valueChanged)
    }
    @objc func onHandleSegmented(_ segmentController : UISegmentedControl){
        print("segment changed")
        switch segmentController.selectedSegmentIndex {
            case 0 : dataList = datalist1
            case 1,2 : self.dataList.removeAll()
            default : break
        }
        self.segmentTableView.reloadData()
//        if segmentController.selectedSegmentIndex != 0 {
//            dataList.removeAll()
//            self.segmentTableView.reloadData()
//        }else{
//            dataList = pageControll.currentPage == 0 ? datalist1 : pageControll.currentPage == 1 ? datalist2 : datalist3
//            self.segmentTableView.reloadData()
//        }
       
    }
    @objc func pageControllDidchange(_ sender : UIPageControl){
        print("nimadir")
        let current = sender.currentPage
        scrollVieww.setContentOffset(CGPoint(x: CGFloat(current) * self.mainView.frame.width, y: 0), animated: true)
        
        if sender.currentPage == 0 {
            dataList = datalist1
            self.segmentTableView.reloadData()
        }else if sender.currentPage == 1{
            dataList = datalist2
        }else if sender.currentPage == 2{
            dataList = datalist3
        }
        self.segmentTableView.reloadData()
    }


}
extension IpotekaKartalarVCViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
                pageControll.currentPage = Int(pageIndex)
        if segmentControll.selectedSegmentIndex == 0 {
            if pageControll.currentPage == 0 {
                dataList = datalist1
            }else if pageControll.currentPage == 1{
                dataList = datalist2
            }else if pageControll.currentPage == 2{
                dataList = datalist3
            }
            self.segmentTableView.reloadData()
        } else {
            dataList.removeAll()
            self.segmentTableView.reloadData()
        }
    }
}
extension IpotekaKartalarVCViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AboutCardCell.identifier, for: indexPath) as! AboutCardCell
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.model = dataList[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
