//
//  HomeHeaderV.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 15/01/23.
//

import UIKit

class HomeHeaderV: UIView {

    private var leftBarBtn : UIButton!
    
    private var helloNameStackView : UIStackView!
    private var helloLbl : UILabel!
    private var nameLbl : UILabel!

    private var rightBtn1 : UIButton!
    private var rightBtn2 : UIButton!
    
    
    override init(frame: CGRect) {

        super.init(frame: frame)
        self.initVV()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initVV(){
        
        leftBarBtn = UIButton()
        leftBarBtn.setImage(UIImage(named: ""), for: .normal)
        leftBarBtn.clipsToBounds = true
        leftBarBtn.layer.borderColor = UIColor.white.cgColor
        leftBarBtn.layer.borderWidth = 1
        leftBarBtn.layer.cornerRadius = 30
        self.addSubview(leftBarBtn)
        leftBarBtn.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        
        helloLbl = UILabel()
        helloLbl.text = "Salom,"
        helloLbl.textColor = .lightGray
        helloLbl.font = .boldSystemFont(ofSize: 14)
        
        nameLbl = UILabel()
        nameLbl.text = "Bobomurod"
        nameLbl.textColor = .white
        nameLbl.font = .boldSystemFont(ofSize: 20)
        
        helloNameStackView = UIStackView(arrangedSubviews: [helloLbl,nameLbl])
        helloNameStackView.axis = .vertical
        helloNameStackView.distribution = .fill
        helloNameStackView.alignment = .fill
        
        self.addSubview(helloNameStackView)
        helloNameStackView.snp.makeConstraints { make in
            make.left.equalTo(leftBarBtn.snp.right).offset(10)
            make.centerY.equalToSuperview()
            make.width.equalTo(150)
        }
        helloLbl.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        nameLbl.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        
        
        rightBtn1 = UIButton()
        rightBtn1.setImage(UIImage(named: "calendar"), for: .normal)
        self.addSubview(rightBtn1)
        rightBtn1.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(25)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        rightBtn2 = UIButton()
        rightBtn2.setImage(UIImage(named: "arrow_down"), for: .normal)
        self.addSubview(rightBtn2)
        rightBtn2.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
//            make.width.equalTo(50)
        }
        
    }
    
}
