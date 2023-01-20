//
//  PerevodCardView.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 20/01/23.
//

import UIKit

class PerevodCardViewCell: UITableViewCell {

    var data = [
        PerevodCardDM(cardNumber: "8600 61** **** 6387",cardBalance: "49 867,07 UZS",data: "05.09.2020")
    ]
    private var container : UIView!
    var titleLbl : UILabel!
    var balancLbl : UILabel!
    var dataLBL : UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for sb in self.contentView.subviews {
            sb.removeFromSuperview()
        }
        container = UIView()
        container.layer.cornerRadius = 12
        container.backgroundColor = .white
        container.makeShadow()
        self.contentView.addSubview(container)
        container.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(10)
            make.right.bottom.equalToSuperview().inset(10)
        }
        titleLbl = UILabel()
        titleLbl.text = data[0].cardNumber
        titleLbl.font = .boldSystemFont(ofSize: 18)
        self.container.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(15)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        balancLbl = UILabel()
        balancLbl.text = data[0].cardBalance
        balancLbl.font = .boldSystemFont(ofSize: 26)
        balancLbl.textColor = .green
        self.container.addSubview(balancLbl)
        balancLbl.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalTo(titleLbl.snp.bottom).offset(5)
            make.width.equalTo(250)
            make.height.equalTo(40)
        }
//        self.contentView.backgroundColor = .red
       
    
        dataLBL = UILabel()
        var nima : NSAttributedString {
            let info = NSMutableAttributedString(string: "Дата: ",attributes: [.font : UIFont.systemFont(ofSize: 12),.foregroundColor : UIColor.gray])
            info.append(NSAttributedString(string: "\(data[0].data ?? "")",attributes: [.font : UIFont.boldSystemFont(ofSize: 15),.foregroundColor : UIColor.darkGray]))
            return info
        }
        dataLBL.attributedText = nima
//        dataLBL.font = .boldSystemFont(ofSize: 18)
        self.container.addSubview(dataLBL)
        dataLBL.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalTo(balancLbl.snp.bottom).offset(5)
            make.width.equalTo(300)
            make.height.equalTo(30)
        }
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
}
