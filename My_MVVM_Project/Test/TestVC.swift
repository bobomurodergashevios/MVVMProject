//
//  TestViewController.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 07/01/23.
//

import UIKit
import FSPagerView
protocol TestViewControllerLogic : TestViewInstallerLogic {
    func setupTargets()
}

class TestViewController : UIViewController,TestViewControllerLogic {
    var refreshControl: UIRefreshControl!
    
    var mainVieww: UIView!
    
    var mainOperationsView1: UIView!
    
    var mainOperationsView2: UIView!
    
    var mainOperationsView3: UIView!
    
    var mainOperationsView4: UIView!
    
    var stackView: UIStackView!
    
    var scrollView: UIScrollView!
    
    var navHeaderView: UIView!
    var collView: UICollectionView!
    var pagerView: FSPagerView!
    var tezOtkazmaView: TezkorUtkazmaView!
    var indicator : UIActivityIndicatorView!
    var mainView: UIView! {self.view}
    var presenter : TestViewPresenterLogic?
    
    override func viewDidLoad() {
        presenter?.viewDidLoad()
        self.mainView.backgroundColor = UIColor(hex: "#F7F7F7")
//        self.navigationItem.titleView = HomeHeaderView()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    func setupTargets() {
      
        refreshControl?.addTarget(self, action: #selector(pullToRefresh(_:)), for: .valueChanged)
        
    }
    @objc func onInfoBtn(){
//        let vc = ProbaViewController()
//        if #available(iOS 15.0, *) {
//            if let sheet = vc.sheetPresentationController{
//                sheet.detents = [.large(),.medium()]
//                sheet.prefersGrabberVisible = true
//                sheet.largestUndimmedDetentIdentifier = .large
//            }
//        }
//        present(vc, animated: true)
    }
    @objc func pullToRefresh(_ refreshControl : UIRefreshControl) {
        presenter?.handleRefresh()
    }
  
    
}
