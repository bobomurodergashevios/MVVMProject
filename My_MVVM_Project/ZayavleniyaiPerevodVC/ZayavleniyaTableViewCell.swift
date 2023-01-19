//
//  ZayavleniyaCardView.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 26/12/22.
//

import UIKit

class ZayavleniyaCardViewCell : UITableViewCell {
    static let identifier = "ZayavleniyaCardViewCell"
    private var containerView : UIView!
    private var balanceLbl : UILabel!
    private var dataLbl1 : UILabel!
    private var dataLbl2 : UILabel!
    private var schetNumLbl : UILabel!
    private var companyNameLbl : UILabel!
    private var accountNumberLbl1 : UILabel!
    private var accountNumberLbl2 : UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        for sbw in self.contentView.subviews {
            sbw.removeFromSuperview()
        }
        
        
        containerView = UIView()
        containerView.makeShadow()
        containerView.layer.cornerRadius = 12
        containerView.backgroundColor = .white
        self.contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        
        balanceLbl = UILabel()
        balanceLbl.text = "49 298,09 USD"
        balanceLbl.textColor = UIColor(hex: "#2AA65C")
        balanceLbl.font = .boldSystemFont(ofSize: 19)
        self.containerView.addSubview(balanceLbl)
        balanceLbl.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(200)
            make.top.equalToSuperview().offset(25)
            make.height.equalTo(20)
        }
        
        dataLbl1 = UILabel()
        dataLbl1.text = "Дата:"
        dataLbl1.textColor = UIColor(hex: "#99A3B3")
        dataLbl1.font = .systemFont(ofSize: 12)
        dataLbl1.textAlignment = .left
        self.containerView.addSubview(dataLbl1)
        dataLbl1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(50)
            make.top.equalTo(balanceLbl.snp.bottom).offset(-5)
            make.height.equalTo(40)
        }

        
        dataLbl2 = UILabel()
        dataLbl2.text = "05.09.2022"
        dataLbl2.textColor = UIColor(hex: "#566681")
        dataLbl2.font = .systemFont(ofSize: 12)
        self.containerView.addSubview(dataLbl2)
        dataLbl2.snp.makeConstraints { make in
            make.leading.equalTo(dataLbl1.snp.trailing).offset(-13)
            make.width.equalTo(100)
            make.top.equalTo(balanceLbl.snp.bottom).offset(-5)
            make.height.equalTo(40)
        }

        
        schetNumLbl = UILabel()
        schetNumLbl.text = "2072 9797 3395 8970 0417 0200 003"
        schetNumLbl.textColor = UIColor(hex: "#071222")
        schetNumLbl.font = .boldSystemFont(ofSize: 14)
        self.containerView.addSubview(schetNumLbl)
        schetNumLbl.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(300)
            make.top.equalTo(dataLbl1.snp.bottom)
            make.height.equalTo(20)
        }

        
        companyNameLbl = UILabel()
        companyNameLbl.text = "TIELONG LOGISTICS (JIANGSU) Co. Ltd"
        companyNameLbl.textColor = UIColor(hex: "#566681")
        companyNameLbl.font = .systemFont(ofSize: 12)
        self.containerView.addSubview(companyNameLbl)
        companyNameLbl.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(300)
            make.top.equalTo(schetNumLbl.snp.bottom)
            make.height.equalTo(20)
        }

        
        accountNumberLbl1 = UILabel()
        accountNumberLbl1.text = "Account:"
        accountNumberLbl1.textColor = UIColor(hex: "#99A3B3")
        accountNumberLbl1.font = .systemFont(ofSize: 12)
        accountNumberLbl1.textAlignment = .left
        self.containerView.addSubview(accountNumberLbl1)
        accountNumberLbl1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(70)
            make.top.equalTo(companyNameLbl.snp.bottom)
            make.height.equalTo(20)
        }

        
        accountNumberLbl2 = UILabel()
        accountNumberLbl2.text = "487 165 734 907"
        accountNumberLbl2.textColor = UIColor(hex: "#566681")
        accountNumberLbl2.font = .boldSystemFont(ofSize: 12)
        self.containerView.addSubview(accountNumberLbl2)
        accountNumberLbl2.snp.makeConstraints { make in
            make.leading.equalTo(accountNumberLbl1.snp.trailing).offset(-13)
            make.width.equalTo(140)
            make.top.equalTo(companyNameLbl.snp.bottom)
            make.height.equalTo(20)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
    var model : CardModel! {
        didSet {
            self.balanceLbl.text = model.amount
            self.dataLbl2.text = model.data
            self.schetNumLbl.text = model.schetaNumber
            self.companyNameLbl.text = model.companyName
            self.accountNumberLbl2.text = model.accountNumber
            
        }
    }
        
}
    
  

