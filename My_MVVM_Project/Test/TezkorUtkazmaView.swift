//
//  TezkorO'tkazmaView.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 09/01/23.
//

import UIKit

class TezkorUtkazmaView: UIView {

    private var tezkorLbl : UILabel!
    private var btn1 : MyButton!
    private var btn2 : MyButton!
    private var txtContainer1 : UIView!
    private var txtContainer2 : UIView!
    private var txtField1 : MyTextField!
    private var txtField2 : MyTextField!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tezkorLbl = UILabel()
        tezkorLbl.text = "Tezkor O'tkazma"
        tezkorLbl.textColor = .black
        tezkorLbl.font = .boldSystemFont(ofSize: 14)
        self.addSubview(tezkorLbl)
        tezkorLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(150)
            make.height.equalTo(20)
        }
        
        btn1 = MyButton(frame: .zero, mode: .activ, title: "Karta raqami")
        btn1.layer.cornerRadius = 5
        btn1.titleLabel?.font = .boldSystemFont(ofSize: 14)
        self.addSubview(btn1)
        btn1.snp.makeConstraints { make in
            make.left.equalTo(tezkorLbl.snp.right)
            make.width.equalTo(90)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(20)
        }
        btn2 = MyButton(frame: .zero, mode: .unactiv, title: "Telefon raqami")
        btn2.titleLabel?.font = .boldSystemFont(ofSize: 14)
        btn2.layer.cornerRadius = 5
        self.addSubview(btn2)
        btn2.snp.makeConstraints { make in
            make.left.equalTo(btn1.snp.right)
            make.width.equalTo(100)
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(20)
        }
        
        btn1.addTarget(self, action: #selector(onBtn1(_:)), for: .touchUpInside)
        btn2.addTarget(self, action: #selector(onBtn2(_:)), for: .touchUpInside)
        
        txtField1 = MyTextField(frame: .zero, mode: .cardNumber)
        txtField1.font = .systemFont(ofSize: 17)
        txtField1.layer.borderWidth = 0.5
        txtField1.layer.cornerRadius = 10
        txtField1.layer.borderColor = UIColor.black.cgColor
        txtField1.isUserInteractionEnabled = true
        txtField1.addTarget(self, action: #selector(onTextChanged(_:)), for: .valueChanged)
        self.addSubview(txtField1)
        txtField1.snp.makeConstraints { make in
            make.top.equalTo(btn1.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(50)
            
        }
        
        txtField2 = MyTextField(frame: .zero, mode: .phoneNumber)
        txtField2.font = .systemFont(ofSize: 17)
        txtField2.layer.borderWidth = 0.5
        txtField2.layer.cornerRadius = 10
        txtField2.layer.borderColor = UIColor.black.cgColor
        txtField2.alpha = 0
        txtField2.isUserInteractionEnabled = true
        txtField2.addTarget(self, action: #selector(onTextChanged2(_:)), for: .valueChanged)
        self.addSubview(txtField2)
        txtField2.snp.makeConstraints { make in
            make.top.equalTo(btn1.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(50)
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func onTextChanged(_ textField : UITextField){
        guard let text = textField.text else {return}
        if text.count <= 4 {
            
        }
    }
    @objc func onTextChanged2(_ textField : MyTextField){
        guard let text = textField.text else {return}
        if text.count <= 4 {
            
        }
    }
    @objc func onBtn1(_ sender : MyButton){
        if sender.mymode != .activ {
            btn1.mymode = .activ
            btn2.mymode = .unactiv
            txtField2.alpha = 0
            txtField1.alpha = 1
        }
    }
    
    @objc func onBtn2(_ sender : MyButton){
        if sender.mymode != .activ {
            btn2.mymode = .activ
            btn1.mymode = .unactiv
            txtField1.alpha = 0
            txtField2.alpha = 1
        }
    }
}
