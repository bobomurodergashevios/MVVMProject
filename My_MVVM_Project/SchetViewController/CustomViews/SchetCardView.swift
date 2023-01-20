//
//  SchetCardView.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 20/01/23.
//

import UIKit

class SchetCardView: UIView {

    private var titleLbl : UILabel!
    private var cardBalanceLBL : UILabel!
    private var copyBtn : UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLbl = UILabel()
        titleLbl.text = "Schet"
        titleLbl.textColor = .gray
        titleLbl.font = .systemFont(ofSize: 15)
        self.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(90)
            make.top.equalToSuperview().offset(15)
            make.height.equalTo(30)
        }
        
        cardBalanceLBL = UILabel()
        cardBalanceLBL.text = "8600 61** **** 6578"
        cardBalanceLBL.textColor = .black
        cardBalanceLBL.font = .boldSystemFont(ofSize: 19)
        self.addSubview(cardBalanceLBL)
        cardBalanceLBL.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(250)
            make.top.equalTo(titleLbl.snp.bottom)
            make.height.equalTo(20)
        }
        
        copyBtn = UIButton()
        copyBtn.setImage(UIImage(named: "Icon"), for: .normal)
        copyBtn.backgroundColor = .clear
        self.addSubview(copyBtn)
        copyBtn.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(10)
            make.width.equalTo(30)
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
