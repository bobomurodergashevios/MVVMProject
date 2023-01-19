//
//  MyButton.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 09/01/23.
//

import UIKit

class MyButton: UIButton {

    var mymode : BtnMode! {
        didSet {
            updateUI(mode: mymode)
        }
    }
    init(frame: CGRect,mode : BtnMode,title : String) {
        super.init(frame: frame)
        setTitle(title, for: .normal)
        setTitleColor(mode.titleColor, for: .normal)
        backgroundColor = mode.bacColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateUI(mode : BtnMode){
        setTitleColor(mode.titleColor, for: .normal)
        backgroundColor = mode.bacColor
    }
    
}

enum BtnMode {
    case activ
    case unactiv
    
    var bacColor : UIColor {
        switch self {
        case .activ:
            return .brown
        case .unactiv:
            return .white
        }
    }
    var titleColor : UIColor {
        switch self {
        case .activ:
            return .white
        case .unactiv:
            return .black
        }
    }
}
