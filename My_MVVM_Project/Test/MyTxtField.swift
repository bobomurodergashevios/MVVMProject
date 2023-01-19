//
//  MyTextField.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 09/01/23.
//

import UIKit

class MyTextField: UITextField {

    
    init(frame: CGRect,mode : TxtFieldMode) {
        super.init(frame: frame)
//        txtField1.textColor = .black
//        txtField1.font = .systemFont(ofSize: 17)
//        txtField1.placeholder = " 8600 1234 3443 6577"
        font = .systemFont(ofSize: 17)
        placeholder = mode.placeHolderTxt
        textColor = .black
        text = mode.txt
        
        let imgV = UIImageView()
        imgV.image = mode.img
        imgV.contentMode = .scaleAspectFit
        self.addSubview(imgV)
        imgV.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().inset(5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
}

enum TxtFieldMode {
    case cardNumber
    case phoneNumber
    
    var img : UIImage? {
        switch self {
        case .cardNumber:
            return UIImage()
        case .phoneNumber:
            return UIImage(named: "Vector 2")
        }
    }
    var txt : String {
        switch self {
        case .cardNumber:
            return ""
        case .phoneNumber:
            return " +998"
        }
    }
    var placeHolderTxt : String {
        switch self {
        case .cardNumber:
            return " 8600 1234 3443 6577"
        case .phoneNumber:
            return ""
        }
    }
    
}
