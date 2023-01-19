//
//  VC.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import Foundation

import UIKit

protocol SimpleDisplayLogic: MyViewInstaller {
    func setupTargets()
}

class MyViewController : UIViewController,SimpleDisplayLogic, UITableViewDataSource, UITableViewDelegate {
    
    
    var expandingView: ExpandingViewww!
    
    var stackView: UIStackView!
    
    

    var mainView: UIView! {self.view}
    var presenter : MyViewPresenterLogic?

    
    var homeheaderView: HomeHeaderView!
    var imageStoryCollectionView: UICollectionView!
    var currencyHeaderView: UIView!
    var currencyHeaderLabel: UILabel!
    var homePlatejiView: HomePlatejiView!
    var homeValCollView: UICollectionView!
    var schetView: SchetaView!
    var scrollView : UIScrollView!
    override func loadView() {
        super.loadView()
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = false

        self.navigationItem.titleView = HomeHeaderView()
        presenter?.viewDidLoad()
    }
    
    func setupTargets() {
        schetView.tableview.dataSource = self
        schetView.tableview.delegate = self
        schetView.tableview.register(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.self)")
        schetView.btn.addTarget(self, action: #selector(onBtnpPressed), for: .touchUpInside)
        expandingView.moreButton.addTarget(self, action: #selector(onReceiverExpand), for: .touchUpInside)
    }
    @objc private func onReceiverExpand(){
        print("more btn")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(UITableViewCell.self)", for: indexPath)
        return cell
    }

    
    @objc func onBtnpPressed(){
        self.presenter?.pushVC()
    }
   
    
    
    
    
    
    
}



    

