//
//  HomeSectionHeaderView.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 16/12/22.
//

import UIKit

class HomeHeaderView: UIView {
    
    var leftImage : UIImageView!
    var accountName : UILabel!
    var searchBtn : UIButton!
    var ringBtn : UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)

        leftImage = UIImageView()
        leftImage.image = UIImage(named: "Vector 2")
        leftImage.contentMode = .scaleAspectFit
        leftImage.clipsToBounds = true
        leftImage.layer.cornerRadius = leftImage.bounds.width/2
        self.addSubview(leftImage)

        accountName = UILabel()
        accountName.text = "CП ООО TIANRUN"
        accountName.font = .boldSystemFont(ofSize: 13)
        accountName.textColor = .black
        self.addSubview(accountName)

        
        searchBtn = UIButton()
        searchBtn.setImage(UIImage(named: "Vector 1"), for: .normal)
        self.addSubview(searchBtn)

        
        
        ringBtn = UIButton()
        ringBtn.setImage(UIImage(named: "Notifications"), for: .normal)
        self.addSubview(ringBtn)

    addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraint() {

        leftImage.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.top.equalToSuperview().offset(10)

        }
        accountName.snp.makeConstraints { make in
            make.width.equalTo(140)
            make.top.equalToSuperview().offset(18)
            make.left.equalTo(leftImage.snp.right).offset(15)
        }
        
        searchBtn.snp.makeConstraints { make in
            make.width.height.equalTo(25)
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(accountName.snp.right).offset(120)
            
            
        }
        ringBtn.snp.makeConstraints { make in
            make.width.height.equalTo(25)
            make.top.equalToSuperview().offset(10)

            make.left.equalTo(searchBtn.snp.right).offset(10)
        }
    }
    
    
}
