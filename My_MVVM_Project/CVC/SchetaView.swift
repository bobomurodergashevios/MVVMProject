////
////  SchetaView.swift
////  My_MVVM_Project
////
////  Created by Bobomurod Ergashev on 18/01/23.
////
//
//import Foundation
//
//import UIKit
//import SnapKit
//class SchetaView : UIView {
//    
//    var leftTextLbl: UILabel!
//    
//    var btn: UIButton!
//    
//    var tableview: UITableView!
//
//    var mainStackView : UIStackView!
//    
//    public override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        
//        leftTextLbl = UILabel()
//        leftTextLbl.textColor = .brown
//        leftTextLbl.text = "Счета"
//        leftTextLbl.font = .boldSystemFont(ofSize: 18)
//        leftTextLbl.numberOfLines = 0
//
//        
//        btn = UIButton()
//        btn.setTitle("Все счети  >", for: .normal)
//        btn.setTitleColor(.white, for: .normal)
//        btn.titleLabel?.font = .boldSystemFont(ofSize: 12)
//        btn.layer.cornerRadius = 10
//        btn.titleLabel?.contentMode = .left
//        
//        btn.backgroundColor = .brown
//        
//        
//        mainStackView = UIStackView()
//        mainStackView.spacing = 16
//        mainStackView.axis = .horizontal
//        mainStackView.alignment = .center
//        mainStackView.distribution = .equalCentering
//        mainStackView.addArrangedSubview(leftTextLbl)
//        mainStackView.addArrangedSubview(btn)
//        
//        
//        
//        tableview = UITableView()
//        tableview.isScrollEnabled = false
//        self.addSubview(mainStackView)
//        self.addSubview(tableview)
//        addConstraint()
//        self.backgroundColor = .gray
//    }
//    
//    
//    func addConstraint() {
//        btn.snp.makeConstraints { make in
//            make.width.greaterThanOrEqualTo(100)
//        }
//        mainStackView.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(5)
//            make.right.equalToSuperview().offset(-15)
//            make.left.equalToSuperview().offset(15)
//            make.height.equalTo(40)
////            make.centerY.equalToSuperview()
//        }
//        
//        tableview.snp.makeConstraints { make in
//            make.top.equalTo(mainStackView.snp.bottom).offset(10)
//            make.width.equalToSuperview()
//            make.height.greaterThanOrEqualTo(220)
//        }
//        
//        
//        
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
// 
//}
