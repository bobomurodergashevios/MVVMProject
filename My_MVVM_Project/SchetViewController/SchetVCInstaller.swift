//
//  SchetVCInstaller.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 20/01/23.
//

import UIKit
protocol SchetVCInstaller : ViewInstaller {
    var balanceView : BalanceView! { get set}
    var schetCardView : SchetCardView! {get set}
    var dataView : RequiredDataView! {get set}
    var tableview : UITableView! {get set}
    
}
extension SchetVCInstaller {
    
    func initSubviews() {
        balanceView = BalanceView()

        schetCardView = SchetCardView()
        schetCardView.backgroundColor = .white
        schetCardView.layer.cornerRadius = 12
        schetCardView.makeShadow()
        
        dataView = RequiredDataView()
        dataView.backgroundColor = .white
        dataView.layer.cornerRadius = 12
        dataView.makeShadow()
        
        
        tableview = UITableView(frame: .zero, style: .plain)
        tableview.backgroundColor = .clear
        tableview.showsVerticalScrollIndicator = false
        tableview.separatorStyle = .none
        
    }
    
    func embedSubviews() {
        mainView.addSubview(balanceView)
        mainView.addSubview(schetCardView)
        mainView.addSubview(dataView)
        mainView.addSubview(tableview)
    }
    
    func addSubviewsConstraints() {
        balanceView.snp.makeConstraints { make in
            make.height.equalTo(110)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.top.equalTo(mainView.safeAreaLayoutGuide.snp.top).offset(30)
        }
        schetCardView.snp.makeConstraints { make in
            make.height.equalTo(90)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.top.equalTo(balanceView.snp.bottom).offset(20)
        }
        
        dataView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.top.equalTo(schetCardView.snp.bottom).offset(20)
        }
        tableview.snp.makeConstraints { make in
            make.top.equalTo(dataView.snp.bottom).offset(20)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
}
