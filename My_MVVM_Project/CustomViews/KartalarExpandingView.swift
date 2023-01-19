//
//  KartalarExpandingView.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 17/01/23.
//

import UIKit

class KartalarExpandingView: UIView {
    
    var kartaPlustxt : String = "+ Kartani buyurtma qiling/ulang"
    var omonatPlustxt : String = "+ Omonat ochish"
    var kreditPlustxt : String = "+ Kredit rasmiylashtirish"
    
        private var headerView: UIView!
        private var kartaniBuyurtmaBerishLbl : UILabel!
        private var mainStackView: UIStackView!
        public var headerLabel: UILabel!
        public var moreButton: UIButton!
        public var stackView: UIView!
        private var tooltipBtn : UIButton!
        
    public init(title: String,count : Int,plusBtnTxt : String){
        super.init(frame: .zero)

            mainStackView = UIStackView()
            mainStackView.axis = .vertical
            mainStackView.alignment = .fill
            mainStackView.distribution = .fill
            mainStackView.spacing = 8
            
            headerView = UIView()
            headerView.backgroundColor = .clear
        
            
            
            kartaniBuyurtmaBerishLbl = UILabel()
            kartaniBuyurtmaBerishLbl.text = plusBtnTxt
            kartaniBuyurtmaBerishLbl.textAlignment = .center
            kartaniBuyurtmaBerishLbl.layer.cornerRadius = 10
            kartaniBuyurtmaBerishLbl.layer.borderColor = UIColor.gray.cgColor
            kartaniBuyurtmaBerishLbl.layer.borderWidth = 1.0
        
            headerLabel = UILabel()
            headerLabel.text = title
            headerLabel.textAlignment = .center
            headerLabel.font = .boldSystemFont(ofSize: 14)
            headerLabel.textColor = .black
            headerLabel.isUserInteractionEnabled = true
            
            moreButton = UIButton()
            moreButton.setImage(UIImage(named: "arrow_down"), for: .normal)
            moreButton.imageView?.contentMode = .scaleAspectFit
            
        
            tooltipBtn = UIButton()
            tooltipBtn.setImage(UIImage(named: "menu"), for: .normal)
            
        
            stackView = UIView()
            stackView.alpha = 0
            stackView.isHidden = true
            
          
            
           
            
            
            
            
            
            
            self.addSubview(mainStackView)
            mainStackView.addArrangedSubview(headerView)
//            mainStackView.addArrangedSubview(kartaniBuyurtmaBerishLbl)
            mainStackView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }

        
            headerView.addSubview(headerLabel)
            headerView.addSubview(moreButton)
            headerView.addSubview(tooltipBtn)
            if !plusBtnTxt.isEmpty {
                headerView.addSubview(kartaniBuyurtmaBerishLbl)
                kartaniBuyurtmaBerishLbl.snp.makeConstraints { make in
                    make.top.equalTo(tooltipBtn.snp.bottom)
                    make.centerX.equalToSuperview()
                    make.height.equalTo(40)
                    make.width.equalTo(260)

                }
            
            }
        
           
            headerLabel.snp.makeConstraints { make in
                make.left.equalToSuperview()
                make.top.equalToSuperview().offset(10)
                make.width.equalTo(90)
                make.height.equalTo(40)
            }
            
            moreButton.snp.makeConstraints { make in
                make.centerY.equalTo(headerLabel.snp.centerY)
                make.left.equalTo(headerLabel.snp.right)
            }
        
            tooltipBtn.snp.makeConstraints { make in
                make.centerY.equalTo(headerLabel.snp.centerY)
                make.left.equalTo(moreButton.snp.right).offset(250)
                make.width.height.equalTo(30)
//                make.centerY.equalTo(headerLabel.snp.centerY)
            }
            
            mainStackView.addArrangedSubview(stackView)
            stackView.snp.makeConstraints { make in
                make.height.equalTo(150)
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    
   
}
