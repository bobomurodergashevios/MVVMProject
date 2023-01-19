//
//  HisobraqamlarViewInstaller.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 10/01/23.
//

import UIKit
protocol HisobraqamlarViewInstallerLogic : ViewInstaller {
    
    
    var scrollView : UIScrollView! {get set}
    var refreshControl : UIRefreshControl! {get set}
    var stackView : UIStackView! {get set}
    var cardVV : CardViewww! {get set}
    
    
    
}
extension HisobraqamlarViewInstallerLogic {
    
    func initSubviews() {
        
        
        
        
        
        
        
        
        cardVV = CardViewww(frame: .zero, mode: .withCarta)
        cardVV.makeShadow()
        cardVV.layer.cornerRadius = 15
        
        stackView = UIStackView(arrangedSubviews: [cardVV])
        stackView.axis = .vertical
        stackView.backgroundColor = .blue
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 20
        
        
        scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        scrollView.keyboardDismissMode = .interactiveWithAccessory
        scrollView.showsVerticalScrollIndicator = false
        
        refreshControl = UIRefreshControl()
        scrollView.refreshControl = refreshControl
            
        
        
    }
    func embedSubviews() {
        scrollView.addSubview(stackView)
        mainView.addSubview(scrollView)
        
    }
    func addSubviewsConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
        }
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(self.mainView.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(mainView.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
