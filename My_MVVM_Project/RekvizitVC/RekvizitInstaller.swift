//
//  RekvizitInstaller.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import Foundation
import UIKit

protocol RekvizitViewInstaller : ViewInstaller {
    var titleLbl : UILabel! {get set}
    var textfield1 : FloatingTextFieldView! {get set}
    var container1 : UIView! {get set}
    var textfield2 : FloatingTextFieldView! {get set}
    var container2 : UIView! {get set}
    var textfield3 : FloatingTextFieldView! {get set}
    var container3 : UIView! {get set}
    var container4 : UIView! {get set}
    var textfield4 : MaterialMultilineOutlinedView! {get set}
    var container5 : UIView! {get set}
    var textfield5 : FloatingTextFieldView! {get set}
    var submitBtn : UIButton! {get set}
//    var multilineView : MaterialMultilineOutlinedView! {get set}
}

extension RekvizitViewInstaller {
    
    
    func initSubviews() {
        mainView?.backgroundColor = .white
        
        titleLbl = UILabel()
        titleLbl.text =
        "Реквизиты банковского счета, на который зачисляется выручка, полученная по пластиковым карточкам"
        titleLbl.numberOfLines = 3
        titleLbl.textAlignment = .left
        
        
        container1 = UIView()
//        container1.backgroundColor = .blue
        container1.layer.cornerRadius = 12
        container1.layer.shadowRadius = 1
        container1.layer.shadowOffset = .init(width: 0, height: 0)
        container1.layer.shadowColor = UIColor.black.cgColor
        container1.layer.shadowOpacity = 1.0
        
        textfield1 = FloatingTextFieldView()
        textfield1.setPlaceholder(name: "Счет")
        textfield1.setMaxChar(maxChar: 5)
        
        container2 = UIView()
        container2.layer.cornerRadius = 12
        container2.layer.shadowRadius = 1
        container2.layer.shadowOffset = .init(width: 0, height: 0)
        container2.layer.shadowColor = UIColor.black.cgColor
        container2.layer.shadowOpacity = 1.0
        
        textfield2 = FloatingTextFieldView()
        textfield2.setPlaceholder(name: "МФО")
        textfield2.type = .password        
        textfield2.showDropDownIcon()
    
        container3 = UIView()
            container3.layer.cornerRadius = 12
            container3.layer.shadowRadius = 1
            container3.layer.shadowOffset = .init(width: 0, height: 0)
            container3.layer.shadowColor = UIColor.black.cgColor
            container3.layer.shadowOpacity = 1.0
        
        textfield3 = FloatingTextFieldView()
        textfield3.setPlaceholder(name: "ИНН")
        
        
        
        container4 = UIView()
        container4 .layer.cornerRadius = 12
        container4 .layer.shadowRadius = 1
        container4 .layer.shadowOffset = .init(width: 0, height: 0)
        container4 .layer.shadowColor = UIColor.black.cgColor
        container4 .layer.shadowOpacity = 1.0
        
        textfield4 = MaterialMultilineOutlinedView()
        textfield4.setPlaceholder(name: "Банк")
        
        container5 = UIView()
        container5.layer.cornerRadius = 12
        container5.layer.shadowRadius = 1
        container5.layer.shadowOffset = .init(width: 0, height: 0)
        container5.layer.shadowColor = UIColor.black.cgColor
        container5.layer.shadowOpacity = 1.0
        
        textfield5 = FloatingTextFieldView()
        textfield5.setPlaceholder(name: "Наименование")
        
        
        
        submitBtn = UIButton()
        submitBtn.layer.cornerRadius = 10
        submitBtn.setTitle("Далее", for: .normal)
        submitBtn.setTitleColor(.white, for: .normal)
        submitBtn.backgroundColor = .brown
    }
    func embedSubviews() {
        mainView.addSubview(titleLbl)
        container1.addSubview(textfield1)
        mainView.addSubview(container1)
        container2.addSubview(textfield2)
        mainView.addSubview(container2)
        container3.addSubview(textfield3)
        mainView.addSubview(container3)
        container4.addSubview(textfield4)
        mainView.addSubview(container4)
        container5.addSubview(textfield5)
        mainView.addSubview(container5)
        mainView.addSubview(submitBtn)
    }
    func addSubviewsConstraints() {
        titleLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-15)
            make.topMargin.equalTo(0)
            make.height.equalTo(90)
            
        }
        container1.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).offset(0)
            make.left.right.equalToSuperview()
            make.height.equalTo(90)
        }
        textfield1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.greaterThanOrEqualTo(90)
//            make.height.equalTo(90)
        }
        
        container2.snp.makeConstraints { make in
            make.top.equalTo(container1.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
        textfield2.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.greaterThanOrEqualTo(100)
            make.height.equalTo(90)
        }
        container3.snp.makeConstraints { make in
            make.top.equalTo(container2.snp.bottom).offset(0)
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
        textfield3.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.greaterThanOrEqualTo(100)
        }
        
        container4.snp.makeConstraints { make in
            make.top.equalTo(container3.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(120)
        }
        textfield4.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.greaterThanOrEqualTo(120)
        }
        container5.snp.makeConstraints { make in
            make.top.equalTo(container4.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(90)
        }
        textfield5.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.greaterThanOrEqualTo(90)
        }
        
        submitBtn.snp.makeConstraints { make in
            make.height.equalTo(45)
            make.top.equalTo(container5.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            
        }
    }
   
   
}

