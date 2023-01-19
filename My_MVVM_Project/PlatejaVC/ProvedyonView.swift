//
//  ProvedyonView.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 28/12/22.
//

import UIKit

class ProvedyonView : UIView {
    private var dataLbl : UILabel!
    private var providenBtn : UIButton!
    private var mainSummaLbl : UILabel!
    private var downLbl : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = .clear
        dataLbl = UILabel()
        dataLbl.text = "28.04.2022"
        dataLbl.textColor = UIColor(hex: "#566681")
        dataLbl.font = .systemFont(ofSize: 12)
        self.addSubview(dataLbl)
        dataLbl.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.width.equalTo(80)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(30)
        }
        
        providenBtn = UIButton()
        providenBtn.setTitle("Проведён", for: .normal)
        providenBtn.setTitleColor(.white, for: .normal)
        providenBtn.layer.cornerRadius = 12
        providenBtn.titleLabel?.font = .systemFont(ofSize: 14)
        providenBtn.backgroundColor = .green
        self.addSubview(providenBtn)
        providenBtn.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(30)
            make.width.equalTo(95)
        }
        
        mainSummaLbl = UILabel()
        mainSummaLbl.text = "300 000 000 000,00 UZS"
        mainSummaLbl.textColor = UIColor(hex: "#071222")
        mainSummaLbl.font = .systemFont(ofSize: 26)
        self.addSubview(mainSummaLbl)
        mainSummaLbl.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview().inset(10)
            make.top.equalTo(providenBtn.snp.bottom).offset(15)
            make.height.equalTo(80)
        }
        
        downLbl = UILabel()
        downLbl.text = "Тест ЩК"
        downLbl.textColor = UIColor(hex: "#566681")
        downLbl.font = .systemFont(ofSize: 12)
        self.addSubview(downLbl)
        downLbl.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(mainSummaLbl.snp.bottom)
            make.height.equalTo(30)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
