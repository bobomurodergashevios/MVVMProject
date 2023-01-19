//
//  Installer.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import Foundation

import Foundation
import UIKit


protocol MyViewInstaller : ViewInstaller {
    var stackView : UIStackView! {get set}
    var scrollView : UIScrollView! {get set}
    var schetView : SchetaView! {get set}
    var imageStoryCollectionView : UICollectionView! {get set}
    var homeheaderView : HomeHeaderView! {get set}
    var homePlatejiView : HomePlatejiView! {get set}
    var homeValCollView : UICollectionView! {get set}
    var currencyHeaderView : UIView! {get set}
    var currencyHeaderLabel : UILabel! {get set}
    var expandingView : ExpandingViewww! {get set}
}

extension MyViewInstaller {
    
   
    func initSubviews() {
        mainView?.backgroundColor = .white
        
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 20
        
        
        scrollView = UIScrollView()
        scrollView.keyboardDismissMode = .onDrag
        scrollView.showsVerticalScrollIndicator = false
        
//        homeheaderView = HomeHeaderView()
//        homeheaderView.backgroundColor = .white
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 15
        imageStoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        imageStoryCollectionView.backgroundColor = .white
        imageStoryCollectionView.clipsToBounds = true
        
        
        homePlatejiView = HomePlatejiView()
        homePlatejiView.leftContainer.backgroundColor = .white
        homePlatejiView.leftContainer.layer.cornerRadius = 15
        homePlatejiView.leftContainer.layer.shadowRadius = 5
        homePlatejiView.leftContainer.layer.shadowOffset = .init(width: 0, height: 0)
        homePlatejiView.leftContainer.layer.shadowColor = UIColor.gray.cgColor
        homePlatejiView.leftContainer.layer.shadowOpacity = 1.0
        
        homePlatejiView.rightContainer.backgroundColor = .white
        homePlatejiView.rightContainer.layer.cornerRadius = 15
        homePlatejiView.rightContainer.layer.shadowRadius = 5
        homePlatejiView.rightContainer.layer.shadowOffset = .init(width: 0, height: 0)
        homePlatejiView.rightContainer.layer.shadowColor = UIColor.gray.cgColor
        homePlatejiView.rightContainer.layer.shadowOpacity = 1.0
        
        currencyHeaderView = UIView()
        currencyHeaderView.backgroundColor = .clear
        
        currencyHeaderLabel = UILabel()
        currencyHeaderLabel.text = "Курсы валют"
        currencyHeaderLabel.font = .boldSystemFont(ofSize: 14)
        currencyHeaderLabel.textAlignment = .left
        currencyHeaderLabel.textColor = .black
        currencyHeaderLabel.isUserInteractionEnabled = true
        
        let homeValCollViewlayout = UICollectionViewFlowLayout()
        homeValCollViewlayout.scrollDirection = .horizontal
        homeValCollViewlayout.minimumInteritemSpacing = 16
        homeValCollView = UICollectionView(frame: .zero, collectionViewLayout: homeValCollViewlayout)
        homeValCollView.showsHorizontalScrollIndicator = false
        
        
     
        
        schetView = SchetaView()
        schetView.backgroundColor = .white
        schetView.layer.cornerRadius = 15
        schetView.layer.shadowRadius = 5
        schetView.layer.shadowOffset = .init(width: 0, height: 0)
        schetView.layer.shadowColor = UIColor.black.cgColor
        schetView.layer.shadowOpacity = 1.0
        
        
        
        expandingView = ExpandingViewww(title: "Nimadirrr!")
        expandingView.stackView.alpha = 1
        expandingView.stackView.isHidden = false
        
//        materialOutView = MaterialMultilineView()
//        materialOutView.setPlaceholder(name: "* Банк")
//        materialOutView.setMaxChar(maxChar: 100)
        
//        expandingView
        
    }
    
    func embedSubviews() {
//        stackView.addArrangedSubview(homeheaderView)
        stackView.addArrangedSubview(imageStoryCollectionView)
        stackView.addArrangedSubview(homePlatejiView)
        stackView.addArrangedSubview(currencyHeaderView)
        currencyHeaderView.addSubview(currencyHeaderLabel)
        stackView.addArrangedSubview(homeValCollView)
        stackView.addArrangedSubview(schetView)
        stackView.addArrangedSubview(expandingView)

        scrollView.addSubview(stackView)
        mainView.addSubview(scrollView)
        
    }
    func addSubviewsConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(self.mainView.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(mainView.safeAreaLayoutGuide.snp.bottom)
        }
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
//        homeheaderView.snp.makeConstraints { make in
//            make.height.greaterThanOrEqualTo(70)
//            make.top.equalToSuperview()
//        }
        
        imageStoryCollectionView.snp.makeConstraints { make in
            make.height.equalTo(150)
        }
        
     
        
        homePlatejiView.snp.makeConstraints { make in
            make.height.equalTo(70)
//            make.width.equalTo(140)
        }
        
        currencyHeaderView.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        currencyHeaderLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().inset(32)
            make.bottom.equalToSuperview()
        }
        
        homeValCollView.snp.makeConstraints { make in
            make.height.equalTo(90)
        }
     
       
        schetView.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(290)
        }

    }
    func localizeText() {
        
    }
}
