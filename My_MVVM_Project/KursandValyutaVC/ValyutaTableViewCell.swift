//
//  ValyutaTableViewCell.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 27/12/22.
//

import UIKit

class ValyutaTableViewCell: UITableViewCell {
    static let identifier = "ValyutaTableViewCell"
    private var imgView : UIImageView!
    private var valyutaNameLbl : UILabel!
    private var dollarSshaLbl : UILabel!
    private var prodajaLbl : UILabel!
    private var prodajaValueLbl : UILabel!
    private var pokupkaLbl : UILabel!
    private var pokupkaValueLbl : UILabel!
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        
        for sv in self.contentView.subviews {
            sv.removeFromSuperview()
        }
        
        let containerView = UIView()
        containerView.makeShadow()
        containerView.layer.cornerRadius = 12
        containerView.backgroundColor = .white
        self.contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().offset(10)
        }
        
        imgView = UIImageView()
        imgView.image = UIImage(named: "USD_F")
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 12
        containerView.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.top.equalToSuperview().offset(12)
            make.width.height.equalTo(50)
            make.centerY.equalToSuperview()
        }
        
        
        valyutaNameLbl = UILabel()
        valyutaNameLbl.text = "USD"
        valyutaNameLbl.font = .boldSystemFont(ofSize: 16)
        valyutaNameLbl.textColor = UIColor(hex: "#071222")
        containerView.addSubview(valyutaNameLbl)
        valyutaNameLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalTo(self.imgView.snp.right).offset(10)
            make.width.equalTo(50)
            make.height.equalTo(30)
        }
        
        
        dollarSshaLbl = UILabel()
        dollarSshaLbl.text = "Доллар США"
        dollarSshaLbl.textColor = UIColor(hex: "#566681")
        dollarSshaLbl.font = .systemFont(ofSize: 12)
        containerView.addSubview(dollarSshaLbl)
        dollarSshaLbl.snp.makeConstraints { make in
            make.top.equalTo(valyutaNameLbl.snp.bottom)
            make.left.equalTo(self.imgView.snp.right).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        prodajaLbl = UILabel()
        prodajaLbl.text = "Prodaja"
        prodajaLbl.textColor = UIColor(hex: "#566681")
        prodajaLbl.font = .systemFont(ofSize: 12)
        containerView.addSubview(prodajaLbl)
        prodajaLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalTo(self.dollarSshaLbl.snp.right).offset(25)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        
        prodajaValueLbl = UILabel()
        prodajaValueLbl.text = "10 750 сум"
        prodajaValueLbl.textColor = UIColor(hex: "#071222")
        prodajaValueLbl.font = .boldSystemFont(ofSize: 13)
        containerView.addSubview(prodajaValueLbl)
        prodajaValueLbl.snp.makeConstraints { make in
            make.top.equalTo(prodajaLbl.snp.bottom)
            make.left.equalTo(self.dollarSshaLbl.snp.right).offset(5)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        pokupkaLbl = UILabel()
        pokupkaLbl.text = "Pokupka"
        pokupkaLbl.textColor = UIColor(hex: "#566681")
        pokupkaLbl.font = .systemFont(ofSize: 12)
        containerView.addSubview(pokupkaLbl)
        pokupkaLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalTo(self.prodajaLbl.snp.right).offset(5)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        
        pokupkaValueLbl = UILabel()
        pokupkaValueLbl.text = "10 700 сум"
        pokupkaValueLbl.textColor = UIColor(hex: "#071222")
        pokupkaValueLbl.font = .boldSystemFont(ofSize: 13)
        containerView.addSubview(pokupkaValueLbl)
        pokupkaValueLbl.snp.makeConstraints { make in
            make.top.equalTo(pokupkaLbl.snp.bottom)
            make.left.equalTo(self.prodajaValueLbl.snp.right).offset(5)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model : ValyutaModel! {
        didSet {
            valyutaNameLbl.text = model.valyutaName
            imgView.image = model.logoImg
            prodajaValueLbl.text = model.prodajaValue
            pokupkaValueLbl.text = model.pokupkaValue
        }
    }
    
}
