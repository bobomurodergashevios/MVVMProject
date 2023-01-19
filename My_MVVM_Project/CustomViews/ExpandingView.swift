//
//  ExpandingView.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 13/01/23.
//

import UIKit
class ExpandingViewww: UIView {
    
    private let headerView: UIView
    private let mainStackView: UIStackView
    private let headerImg : UIImageView
    public let headerLabel: UILabel
    public let moreButton: UIButton
    public let stackView: UIView
    public let anketaContainer : UIView
    public let anketaLbl : UILabel
    public let sotibOlishContainer : UIView
    public let sotibOlishLbl : UILabel
    
    public init(title: String){
        
        mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fill
        mainStackView.spacing = 8
        
        headerView = UIView()
        headerView.backgroundColor = .clear
        
        headerImg = UIImageView()
        headerImg.image = UIImage(named: "car")
        headerImg.contentMode = .scaleAspectFit
        headerImg.clipsToBounds = true
        headerImg.layer.masksToBounds = true
        headerImg.layer.cornerRadius = 20
        
        headerLabel = UILabel()
        headerLabel.text = title
        headerLabel.textAlignment = .left
        headerLabel.font = .boldSystemFont(ofSize: 14)
        headerLabel.textColor = .black
        headerLabel.isUserInteractionEnabled = true
        
        moreButton = UIButton()
        moreButton.setImage(UIImage(named: "arrow_down"), for: .normal)
        moreButton.imageView?.contentMode = .scaleAspectFit
        
        stackView = UIView()
        stackView.alpha = 0
        stackView.isHidden = true
        
        anketaContainer = UIView()
        anketaContainer.backgroundColor = .yellow
        anketaContainer.makeShadow()
        anketaContainer.layer.cornerRadius = 12
        stackView.addSubview(anketaContainer)
        anketaContainer.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.width.equalTo(120)
            make.height.equalTo(90)
        }
        
        anketaLbl = UILabel()
        anketaLbl.text = "Anketalar"
        anketaLbl.textColor = .black
        anketaLbl.font = .boldSystemFont(ofSize: 18)
        anketaLbl.textAlignment = .center
        anketaContainer.addSubview(anketaLbl)
        anketaLbl.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        sotibOlishContainer = UIView()
        sotibOlishContainer.backgroundColor = .yellow
        sotibOlishContainer.makeShadow()
        sotibOlishContainer.layer.cornerRadius = 12
        stackView.addSubview(sotibOlishContainer)
        sotibOlishContainer.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(15)
            make.width.equalTo(120)
            make.height.equalTo(90)
        }
        
        sotibOlishLbl = UILabel()
        sotibOlishLbl.text = "Sotib olish"
        sotibOlishLbl.textColor = .black
        sotibOlishLbl.textAlignment = .center
        sotibOlishLbl.font = .boldSystemFont(ofSize: 18)
        sotibOlishContainer.addSubview(sotibOlishLbl)
        sotibOlishLbl.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        super.init(frame: .zero)
        
        self.addSubview(mainStackView)
        mainStackView.addArrangedSubview(headerView)
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        headerView.addSubview(headerImg)
        headerView.addSubview(headerLabel)
        headerView.addSubview(moreButton)
        
        headerImg.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
//            make.width.height.equalTo(40)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.left.equalTo(headerImg.snp.right).offset(6)
            make.centerY.equalToSuperview()
        }
        
        moreButton.snp.makeConstraints { make in
            make.centerY.equalTo(headerLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(16)
        }
        
        
        mainStackView.addArrangedSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.height.equalTo(110)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
