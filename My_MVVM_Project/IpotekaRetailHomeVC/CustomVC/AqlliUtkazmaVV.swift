//
//  scroolVV.addSubview(scroolContainerStackView) AqlliUtkazmaVV.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 15/01/23.
//

import UIKit

class AqlliUtkazmaVV: UIView {
    var aqlliUtkazmaLbl : UILabel!
    var stackIcons : UIStackView!
    var aqlliBtn : UIButton!
    var kartagaBtn : UIButton!
    var telnomergaBtn : UIButton!
    var txtFld1 : CustomTXTField!
    var txtFld2 : CustomTXTField!
    var txtFld3 : CustomTXTField!
    var txtFld4 : CustomTXTField!
    var txtFld5 : CustomTXTField!
    var txtFld6 : CustomTXTField!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        aqlliUtkazmaLbl = UILabel()
        aqlliUtkazmaLbl.text = "Aqlli o'tkazma"
        aqlliUtkazmaLbl.textColor = .white
        aqlliUtkazmaLbl.font = .boldSystemFont(ofSize: 20)
        self.addSubview(aqlliUtkazmaLbl)
        aqlliUtkazmaLbl.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(190)
            make.height.equalTo(20)
        }
        
        aqlliBtn = UIButton()
        aqlliBtn.setImage(UIImage(named: "arrow_down"), for: .normal)
        aqlliBtn.tag = 1
        aqlliBtn.backgroundColor = .white
        aqlliBtn.snp.makeConstraints { make in
            make.height.equalTo(20)
            
        }
        kartagaBtn = UIButton()
        kartagaBtn.setImage(UIImage(named: "calendar"), for: .normal)
//        kartagaBtn.backgroundColor = .clear
        kartagaBtn.tag = 2
        kartagaBtn.snp.makeConstraints { make in
            make.height.equalTo(20)
            
        }
        telnomergaBtn = UIButton()
        telnomergaBtn.tag = 3
        telnomergaBtn.setImage(UIImage(named: "car"), for: .normal)
//        telnomergaBtn.backgroundColor = .clear
        telnomergaBtn.snp.makeConstraints { make in
            make.height.equalTo(20)
            
        }
        
        stackIcons = UIStackView(arrangedSubviews: [aqlliBtn,kartagaBtn,telnomergaBtn])
        stackIcons.axis = .horizontal
        stackIcons.distribution = .equalSpacing
//        stackIcons.alignment =
        stackIcons.spacing = 5
        self.addSubview(stackIcons)

        stackIcons.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(15)
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(aqlliUtkazmaLbl.snp.right).offset(50)
            make.height.equalTo(30)
        }
        
        
        txtFld1 = CustomTXTField(frame: .zero, title: "Manbani tanlang1", icon: UIImage(named: "arrow_down"))
        txtFld1.backgroundColor = .white
        txtFld1.makeShadow()
        txtFld1.layer.cornerRadius = 12
        self.addSubview(txtFld1)
        txtFld1.snp.makeConstraints { make in
            make.top.equalTo(stackIcons.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(52)
        }
        
        txtFld2 = CustomTXTField(frame: .zero, title: "Manbani tanlang1", icon: UIImage(named: "arrow_down"))
        txtFld2.backgroundColor = .white
        txtFld2.makeShadow()
        txtFld2.layer.cornerRadius = 12
        self.addSubview(txtFld2)
        txtFld2.snp.makeConstraints { make in
            make.top.equalTo(txtFld1.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(52)
        }
        
        txtFld3 = CustomTXTField(frame: .zero, title: "Manbani tanlang2", icon: UIImage(named: "arrow_down"))
        txtFld3.backgroundColor = .white
        txtFld3.makeShadow()
        txtFld3.alpha = 0
        txtFld3.isHidden = true
        txtFld3.layer.cornerRadius = 12
        self.addSubview(txtFld3)
        txtFld3.snp.makeConstraints { make in
            make.top.equalTo(stackIcons.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(52)
        }
        
        txtFld4 = CustomTXTField(frame: .zero, title: "Manbani tanlang2", icon: UIImage(named: "arrow_down"))
        txtFld4.backgroundColor = .white
        txtFld4.makeShadow()
        txtFld4.alpha = 0
        txtFld4.isHidden = true
        txtFld4.layer.cornerRadius = 12
        self.addSubview(txtFld4)
        txtFld4.snp.makeConstraints { make in
            make.top.equalTo(txtFld3.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(52)
        }
        
        
        txtFld5 = CustomTXTField(frame: .zero, title: "Manbani tanlang3", icon: UIImage(named: "arrow_down"))
        txtFld5.backgroundColor = .white
        txtFld5.makeShadow()
        txtFld5.alpha = 0
        txtFld5.isHidden = true
        txtFld5.layer.cornerRadius = 12
        self.addSubview(txtFld5)
        txtFld5.snp.makeConstraints { make in
            make.top.equalTo(stackIcons.snp.bottom).offset(25)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(52)
        }
        
        txtFld6 = CustomTXTField(frame: .zero, title: "Manbani tanlang3", icon: UIImage(named: "arrow_down"))
        txtFld6.backgroundColor = .white
        txtFld6.makeShadow()
        txtFld6.alpha = 0
        txtFld6.isHidden = true
        txtFld6.layer.cornerRadius = 12
        self.addSubview(txtFld6)
        txtFld6.snp.makeConstraints { make in
            make.top.equalTo(txtFld5.snp.bottom).offset(15)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(52)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
