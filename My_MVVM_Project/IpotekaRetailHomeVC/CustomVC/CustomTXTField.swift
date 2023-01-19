//
//  CustomTXTField.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 16/01/23.
//

import UIKit

class CustomTXTField: UIView {

    var txtFld : UITextField!
    var btn : UIButton!
    
    public init(frame: CGRect,title : String,icon : UIImage?) {
        super.init(frame: frame)
        txtFld = UITextField()
        txtFld.text = title
        txtFld.textColor = .darkGray
        txtFld.isEnabled = false
//        txtFld/
        self.addSubview(txtFld)
        txtFld.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(4)
            make.right.equalToSuperview().inset(4)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        btn = UIButton()
        btn.setImage(icon, for: .normal)
        btn.backgroundColor = .clear
        txtFld.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
