
//  ZayavleniyaVCInstaller.swift
//  MyViperProject
//  Created by Bobomurod Ergashev on 26/12/22.


import UIKit
protocol ZayavleniyaVCInstallerLogic : ViewInstaller {
    var indLbl : UILabel! {get set}
    var indTextFieldContainer : UIView! {get set}
    var indTextField : FloatingTextFieldView! {get set}
    var tableview : UITableView! {get set}
}
extension ZayavleniyaVCInstallerLogic {
    func initSubviews() {
        indLbl = UILabel()
        indLbl.text = "ИНД контракт"
        indLbl.font = .boldSystemFont(ofSize: 20)
        
        indTextFieldContainer = UIView()
        indTextFieldContainer.makeShadow()
        
        indTextField = FloatingTextFieldView()
        indTextField.setPlaceholder(name: "ИНД")
        
        tableview = UITableView(frame: .zero, style: .plain)
        tableview.backgroundColor = .clear
        tableview.separatorStyle = .none
        
    }
    func embedSubviews() {
        mainView.addSubview(indLbl)
        mainView.addSubview(indTextFieldContainer)
        indTextFieldContainer.addSubview(indTextField)
        mainView.addSubview(tableview)
    }
    func addSubviewsConstraints() {
        indLbl.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.top.equalToSuperview().offset(100)
        }
        indTextFieldContainer.snp.makeConstraints { make in
            make.top.equalTo(indLbl.snp.bottom).offset(-20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(90)
        }
        indTextField.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(10)
        }
        tableview.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(8)
            make.top.equalTo(indTextFieldContainer.snp.bottom).offset(10)
            make.bottom.equalToSuperview()
            
//
//            make.top.equalToSuperview()
//            make.left.right.equalToSuperview()
//            make.height.equalToSuperview()
            
        }
    }
}

