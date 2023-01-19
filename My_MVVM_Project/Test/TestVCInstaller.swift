//
//  TestViewInstaller.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 07/01/23.
//

import UIKit
import FSPagerView
protocol TestViewInstallerLogic : ViewInstaller {
    var stackView : UIStackView! {get set}
    var scrollView : UIScrollView! {get set}
    var navHeaderView : UIView! {get set}
    var collView : UICollectionView! {get set}
    var pagerView : FSPagerView! {get set}
    var tezOtkazmaView : TezkorUtkazmaView! {get set}
    var mainVieww : UIView! {get set}
    var mainOperationsView1 : UIView! {get set}
    var mainOperationsView2 : UIView! {get set}
    var mainOperationsView3 : UIView! {get set}
    var mainOperationsView4 : UIView! {get set}
    var indicator : UIActivityIndicatorView! {get set}
    var refreshControl : UIRefreshControl! {get set}
}
extension TestViewInstallerLogic {
    
    func initSubviews() {
        if #available(iOS 13.0, *) {
            indicator = UIActivityIndicatorView(style: .large)
            indicator.hidesWhenStopped = true
        } else {
            // Fallback on earlier versions
        }
        
        navHeaderView = HomeHeaderView()
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        
        collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.showsHorizontalScrollIndicator = false
        
        pagerView = FSPagerView()
        pagerView.interitemSpacing = 10
        pagerView.itemSize = CGSize(width: 250, height: 170)
        pagerView.scrollDirection = .horizontal
        pagerView.isInfinite = false
        
        mainVieww = UIView()
        mainVieww.makeShadow()
        mainVieww.layer.cornerRadius = 12
        mainVieww.backgroundColor = .white
        
        mainOperationsView1 = MainOperationView(frame: .zero, img: UIImage(named: "ic_credit-card"), title: "Mening kartalarim")
        
        mainVieww.addSubview(mainOperationsView1)

        mainOperationsView2 = MainOperationView(frame: .zero, img: UIImage(named: "ic_credit-card"), title: "O'tkazmalar")
        mainVieww.addSubview(mainOperationsView2)

        mainOperationsView3 = MainOperationView(frame: .zero, img: UIImage(named: "ic_credit-card"), title: "To'lovlar")
        mainVieww.addSubview(mainOperationsView3)

        mainOperationsView4 = MainOperationView(frame: .zero, img: UIImage(named: "ic_credit-card"), title: "Valyuta ayirboshlash")
        mainVieww.addSubview(mainOperationsView4)
        
        
        tezOtkazmaView = TezkorUtkazmaView()
        tezOtkazmaView.makeShadow()
        tezOtkazmaView.clipsToBounds = true
        tezOtkazmaView.layer.cornerRadius = 12
        tezOtkazmaView.backgroundColor = .white
        
        stackView = UIStackView(arrangedSubviews: [navHeaderView,collView,pagerView,tezOtkazmaView,mainVieww])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 20
        
        scrollView = UIScrollView()
        scrollView.keyboardDismissMode = .interactiveWithAccessory
        scrollView.showsVerticalScrollIndicator = false
        
        refreshControl = UIRefreshControl()
        scrollView.refreshControl = refreshControl

    }
    
    func embedSubviews() {
        mainView.addSubview(scrollView)
        scrollView.addSubview(stackView)
    }
    
    func addSubviewsConstraints() {
//        indicator.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//        }
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(self.mainView.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(mainView.safeAreaLayoutGuide.snp.bottom)
        }
        navHeaderView.snp.makeConstraints { make in
            make.height.equalTo(80)
            
        }
        collView.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        
        pagerView.snp.makeConstraints { make in
            make.height.equalTo(150)
        }
        mainOperationsView1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(15)
            make.width.equalTo(80)
            make.bottom.equalToSuperview().inset(10)
        }
        mainOperationsView2.snp.makeConstraints { make in
            make.left.equalTo(mainOperationsView1.snp.right).offset(5)
            make.top.equalToSuperview().offset(15)
            make.width.equalTo(80)
            make.bottom.equalToSuperview().inset(10)
        }
        mainOperationsView3.snp.makeConstraints { make in
            make.left.equalTo(mainOperationsView2.snp.right).offset(5)
            make.top.equalToSuperview().offset(15)
            make.width.equalTo(80)
            make.bottom.equalToSuperview().inset(10)
        }
        mainOperationsView4.snp.makeConstraints { make in
            make.left.equalTo(mainOperationsView3.snp.right).offset(5)
            make.top.equalToSuperview().offset(15)
            make.width.equalTo(80)
            make.bottom.equalToSuperview().inset(10)
        }
        mainVieww.snp.makeConstraints { make in
            make.height.equalTo(120)
        }
        tezOtkazmaView.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
    }
}
