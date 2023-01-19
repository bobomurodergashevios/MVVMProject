//
//  SettingVCInstaller.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 22/12/22.
//

import Foundation
import UIKit

protocol SettingVCInstallerLogic : ViewInstaller {
    var homeHeaderView : HomeHeaderView! {get set}
    var container: UIView! {get set}
    var standartOrders : StandartOrdersView! {get set}
}

extension SettingVCInstallerLogic {
    
    
    
    
    func initSubviews() {
        self.mainView.backgroundColor = UIColor(hex: "#F7F7F7")
        
        homeHeaderView = HomeHeaderView()
        
        container = UIView()
        container.backgroundColor = .white
        container.makeShadow()
        container.layer.cornerRadius = 12
//        container.addBottomShadow()
        
        standartOrders = StandartOrdersView()
        standartOrders.backgroundColor = .clear
        standartOrders.layer.cornerRadius = 12
        standartOrders.clipsToBounds = true
        
    }
    func embedSubviews() {
        mainView.addSubview(homeHeaderView)
        mainView.addSubview(container)
        container.addSubview(standartOrders)
    }
    func addSubviewsConstraints() {
        homeHeaderView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(70)
        }
        container.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.top.equalTo(homeHeaderView.snp.bottom).offset(0)
            make.height.equalTo(350)
        }
        standartOrders.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.top.bottom.equalToSuperview().offset(0)
        }
    }
}
