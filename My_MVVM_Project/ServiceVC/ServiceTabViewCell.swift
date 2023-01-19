//
//  ServiceTabViewCell.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import Foundation

import UIKit
import SnapKit

class ServicesTableViewCell: UITableViewCell {
    static let identifier = "ServicesTableViewCell"
    var moreButtonClicked:((Bool) -> Void)!
    var openButtonClicked:((Bool) -> Void)!
    
    private var imgView : UIImageView!
    private var boldTitleLbl : UILabel!
    private var mediumTitleLbl : UILabel!
    private var moreBtn : UIButton!
    private var openBtn : UIButton!
    
    var listData: ProductDataModel? {
        didSet {
            if let listData = listData {
                imgView.image = listData.img
                boldTitleLbl.text = listData.boldTitle
                mediumTitleLbl.text = listData.mediumTitle
            }
        }
    }
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        imgView = UIImageView()
        imgView.image = UIImage().withRenderingMode(.alwaysOriginal)
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        self.contentView.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(150)
        }
        
        openBtn = UIButton()
        openBtn.setTitle("Otkrit", for: .normal)
        openBtn.setTitleColor(.brown, for: .normal)
        openBtn.titleLabel?.font = .systemFont(ofSize: 13)
        openBtn.layer.cornerRadius = 12
        openBtn.backgroundColor = .borderLight
        openBtn.addTarget(self, action: #selector(onOpenBtnClicked), for: .touchUpInside)
        
        self.contentView.addSubview(openBtn)
        openBtn.snp.makeConstraints { make in
            make.top.equalTo(imgView.snp.bottom).offset(40)
            make.trailing.equalToSuperview().inset(10)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        boldTitleLbl = UILabel()
        boldTitleLbl.font = .boldSystemFont(ofSize: 18)
        boldTitleLbl.textColor = .black
            
        mediumTitleLbl = UILabel()
        mediumTitleLbl.textColor = .gray
        mediumTitleLbl.font = .systemFont(ofSize: 13)
        mediumTitleLbl.numberOfLines = listData?.mode == .simple ? 1 : 3

        moreBtn = UIButton()
        moreBtn.setTitle("Узнать подробнее", for: .normal)
        moreBtn.setTitleColor(.green, for: .normal)
        moreBtn.titleLabel?.font = .systemFont(ofSize: 13)
//        moreBtn.backgroundColor = .blue
        moreBtn.titleLabel?.textAlignment = .left
        moreBtn.addTarget(self, action: #selector(onMoreBtnClicked), for: .touchUpInside)
        moreBtn.snp.makeConstraints { make in
            make.width.equalTo(120)
            
        }
        let verticalStack = UIStackView(arrangedSubviews: [boldTitleLbl, mediumTitleLbl, moreBtn])
        verticalStack.axis = .vertical
        verticalStack.distribution = .fill
        verticalStack.alignment = .leading
        verticalStack.spacing = 0
        self.contentView.addSubview(verticalStack)
        
        verticalStack.snp.makeConstraints { make in
            make.top.equalTo(imgView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalTo(openBtn.snp.leading).inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onMoreBtnClicked(){
        self.moreButtonClicked(true)
    }
    
    @objc func onOpenBtnClicked(){
        self.openButtonClicked(true)
    }
    
}
