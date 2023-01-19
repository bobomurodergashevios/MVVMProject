//
//  Installer.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import Foundation
import UIKit


protocol SferaDeyatelnostViewInstalller : ViewInstaller {
    var container : UIView! {get set}
    var textView : FloatingTextFieldView! {get set}
    var submitBtn : UIButton! {get set}
    var adressShowlbl : UILabel! {get set}
    var plusBtn : UIButton! {get set}
    var lbl : UILabel! {get set}
}

extension SferaDeyatelnostViewInstalller {
  
    func initSubviews() {
        container = UIView()
        container .layer.cornerRadius = 12
        container .layer.shadowRadius = 1
        container .layer.shadowOffset = .init(width: 0, height: 0)
        container .layer.shadowColor = UIColor.black.cgColor
        container .layer.shadowOpacity = 1.0
        
        textView = FloatingTextFieldView()
        textView.setPlaceholder(name: "Сфера деятельности")
//        textView.showDropDownIcon()
//        textView.setTextFieldText(text: "ABSDFge")
//        textView.setLeadingHelper(text: "leadhelper")
//        textView.setLeadingAttributed(text: .some(.init(string: "dfdsferf")))
        
        
        adressShowlbl = UILabel()
        adressShowlbl.text = "В случае, если ТСП имеет несколько пунктов реализации товаров / услуг и места установки оборудования находятся в разныхчастях города / района, пожалуйста, укажите контактную информацию о торговых точках"
        adressShowlbl.textColor = .gray
        adressShowlbl.font = .systemFont(ofSize: 15)
        adressShowlbl.numberOfLines = 5
        
        plusBtn = UIButton()
        plusBtn.backgroundColor = .blue
        plusBtn.setImage(UIImage(named: "plus"), for: .normal)
        plusBtn.layer.cornerRadius = 30
        
        lbl = UILabel()
        lbl.text = "Добавить адрес"
        lbl.textColor = .green
        lbl.textAlignment = .center
        
        
        submitBtn = UIButton()
        submitBtn.layer.cornerRadius = 10
        submitBtn.setTitle("Далее", for: .normal)
        submitBtn.setTitleColor(.white, for: .normal)
        submitBtn.backgroundColor = .brown
        
        
    }
    
   func embedSubviews() {
       mainView.addSubview(container)
       container.addSubview(textView)
       mainView.addSubview(adressShowlbl)
       mainView.addSubview(plusBtn)
       mainView.addSubview(lbl)
       mainView.addSubview(submitBtn)
       
   }
   
    func addSubviewsConstraints() {
        container.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.height.equalTo(100)
        }
        textView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        adressShowlbl.snp.makeConstraints { make in
            make.top.equalTo(container.snp.bottom).offset(20)
            make.height.equalTo(130)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        plusBtn.snp.makeConstraints { make in
            make.top.equalTo(adressShowlbl.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(60)
        }
        
        lbl.snp.makeConstraints { make in
            make.top.equalTo(plusBtn.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(160)
            make.height.equalTo(30)
        }
        submitBtn.snp.makeConstraints { make in
            make.height.equalTo(45)
            make.bottom.equalToSuperview().offset(-94)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            
        }
        
    }

}

