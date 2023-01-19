//
//  ZayavkaViewInstaller.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 19/12/22.
//

import UIKit
protocol ZayavkaViewInstaller : ViewInstaller {
    var textfield1 : FloatingTextFieldView! {get set}
    var container1 : UIView! {get set}
    var textfield2 : FloatingTextFieldView! {get set}
    var container2 : UIView! {get set}
    var textfield3 : FloatingTextFieldView! {get set}
    var container3 : UIView! {get set}
    var container4 : UIView! {get set}
    var textfield4 : FloatingTextFieldView! {get set}
    var submitBtn : UIButton! {get set}
    var multilineView : MaterialMultilineOutlinedView! {get set}
}
extension ZayavkaViewInstaller {
    
    
    func initSubviews() {
        mainView?.backgroundColor = .white
        container1 = UIView()
        container1.layer.cornerRadius = 12
        container1.layer.shadowRadius = 1
        container1.layer.shadowOffset = .init(width: 0, height: 0)
        container1.layer.shadowColor = UIColor.black.cgColor
        container1.layer.shadowOpacity = 1.0
        
        textfield1 = FloatingTextFieldView()
        textfield1.setPlaceholder(name: "ФИО руководителя")
        
        
        container2 = UIView()
        container2.layer.cornerRadius = 12
        container2.layer.shadowRadius = 1
        container2.layer.shadowOffset = .init(width: 0, height: 0)
        container2.layer.shadowColor = UIColor.black.cgColor
        container2.layer.shadowOpacity = 1.0
        
        textfield2 = FloatingTextFieldView()
        textfield2.setPlaceholder(name: "Контактный номер руководителя")
        
        
        container3 = UIView()
            container3.layer.cornerRadius = 12
            container3.layer.shadowRadius = 1
            container3.layer.shadowOffset = .init(width: 0, height: 0)
            container3.layer.shadowColor = UIColor.black.cgColor
            container3.layer.shadowOpacity = 1.0
        
        textfield3 = FloatingTextFieldView()
        textfield3.setPlaceholder(name: "ФИО бухгалтериа")
        
        
        
        container4 = UIView()
        container4 .layer.cornerRadius = 12
        container4 .layer.shadowRadius = 1
        container4 .layer.shadowOffset = .init(width: 0, height: 0)
        container4 .layer.shadowColor = UIColor.black.cgColor
        container4 .layer.shadowOpacity = 1.0
        
        textfield4 = FloatingTextFieldView()
        textfield4.setPlaceholder(name: "Контактный номер бухгалтера")
        
        submitBtn = UIButton()
        submitBtn.layer.cornerRadius = 10
        submitBtn.setTitle("Далее", for: .normal)
        submitBtn.setTitleColor(.white, for: .normal)
        submitBtn.backgroundColor = .brown
    }
    func embedSubviews() {
        container1.addSubview(textfield1)
        mainView.addSubview(container1)
        container2.addSubview(textfield2)
        mainView.addSubview(container2)
        container3.addSubview(textfield3)
        mainView.addSubview(container3)
        container4.addSubview(textfield4)
        mainView.addSubview(container4)
        mainView.addSubview(submitBtn)
    }
    func addSubviewsConstraints() {
        container1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(120)
            make.left.right.equalToSuperview()
            make.height.equalTo(120)
        }
        textfield1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.greaterThanOrEqualTo(100)
            make.height.equalTo(90)
        }
        
        container2.snp.makeConstraints { make in
            make.top.equalTo(container1.snp.bottom).offset(0)
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
            make.top.equalTo(container2.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
        textfield3.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.greaterThanOrEqualTo(100)
        }
        
        container4.snp.makeConstraints { make in
            make.top.equalTo(container3.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
        textfield4.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.greaterThanOrEqualTo(100)
        }
        
        submitBtn.snp.makeConstraints { make in
            make.height.equalTo(45)
            make.top.equalTo(container4.snp.bottom).offset(120)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            
        }
    }
   
}
