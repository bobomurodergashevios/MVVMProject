//
//  BalanceView.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 20/01/23.
//

import UIKit

class BalanceView: UIView {

    private var balanceLbl : UILabel!
    private var companyNameLbl : UILabel!
    
    var balanceInfoTxt : NSAttributedString {
        let title : NSMutableAttributedString = NSMutableAttributedString(string: "100 000 000 000,00", attributes: [.font : UIFont.boldSystemFont(ofSize: 25) , .foregroundColor : UIColor.black])
        title.append(NSAttributedString(string: "  UZS",attributes: [.font:UIFont.systemFont(ofSize: 20),.foregroundColor : UIColor.gray]))
        return title
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        balanceLbl = UILabel()
        balanceLbl.attributedText = balanceInfoTxt
        self.addSubview(balanceLbl)
        balanceLbl.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.height.equalTo(60)
            make.width.equalTo(350)
        }
        
        companyNameLbl = UILabel()
        companyNameLbl.text = "ИП ООО TIANRUN"
        companyNameLbl.textColor = .gray
        companyNameLbl.font = .systemFont(ofSize: 20)
        self.addSubview(companyNameLbl)
        companyNameLbl.snp.makeConstraints { make in
            make.top.equalTo(balanceLbl.snp.bottom)
            make.left.equalToSuperview().offset(5)
            make.height.equalTo(30)
            make.width.equalTo(200)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
