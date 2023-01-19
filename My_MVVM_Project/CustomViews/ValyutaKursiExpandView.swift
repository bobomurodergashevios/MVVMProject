//
//  ValyutaKursiExpandView.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import UIKit

class ValyutaKursiExpandView: UIView {

    var mainStackView : UIStackView!
    var headerView : UIView!
    var headerLabel : UILabel!
    var moreButton : UIButton!
    
    
    var stackView : UIView!
    var stackChildView : ValyutaExpandStackChildView!

    var almashishButton : UIButton!
    
    init(frame: CGRect,title : String) {
        super.init(frame: frame)
        
        mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fill
        mainStackView.spacing = 8
        
        
        headerView = UIView()
        headerView.backgroundColor = .clear
        
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
        
        stackChildView = ValyutaExpandStackChildView()
        stackChildView.backgroundColor = .clear
        
        
        
        
        almashishButton = UIButton()
        almashishButton.setTitle("Almashish", for: .normal)
        almashishButton.setTitleColor(.white, for: .normal)
        almashishButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        almashishButton.titleLabel?.textAlignment = .center
        almashishButton.layer.cornerRadius = 12
        almashishButton.backgroundColor = .brown
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        self.addSubview(mainStackView)
        mainStackView.addArrangedSubview(headerView)
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        headerView.addSubview(headerLabel)
        headerView.addSubview(moreButton)
        
        headerLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(90)
            make.height.equalTo(40)
        }
        
        moreButton.snp.makeConstraints { make in
            make.centerY.equalTo(headerLabel.snp.centerY)
            make.left.equalTo(headerLabel.snp.right)
        }
        
        
        mainStackView.addArrangedSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.height.equalTo(200)
        }
        stackView.addSubview(stackChildView)
        stackChildView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().inset(10)
            make.top.equalToSuperview()
            make.height.equalTo(140)
        }
        
        stackView.addSubview(almashishButton)
        almashishButton.snp.makeConstraints { make in
            make.top.equalTo(self.stackChildView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
