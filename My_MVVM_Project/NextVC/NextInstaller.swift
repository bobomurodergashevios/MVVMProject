//
//  NextInstaller.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import Foundation

import UIKit
protocol NextVCInstaller : ViewInstaller {
    var containerTable : UIView! {get set}
    var tableview : UITableView! {get set}
    var buttonView: UIView! { get set }
    var gradientLayer: CAGradientLayer! { get set }
    var btn : UIButton! {get set}
}
extension NextVCInstaller {
    
    func initSubviews() {
        
        containerTable = UIView()
        containerTable.makeShadow()
        containerTable.backgroundColor = .white
        containerTable.layer.cornerRadius = 12
        
        tableview = UITableView()
        tableview.backgroundColor = .clear
        tableview.isScrollEnabled = false
        buttonView = UIView()
        buttonView.backgroundColor = .red
        gradientLayer = UIColor.makeGradientColor(UIColor.white, UIColor.blue, .leftToRight)
        
        btn = UIButton()
        btn.setTitle("Soxranit", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 12
        btn.backgroundColor = .clear
    }
    func embedSubviews() {
        mainView.addSubview(containerTable)
        containerTable.addSubview(tableview)
        buttonView.layer.addSublayer(gradientLayer)
        mainView.addSubview(buttonView)
//        buttonView.addSubview(btn)
    }
    func addSubviewsConstraints() {
        containerTable.snp.makeConstraints { make in
            make.height.equalTo(150)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.top.equalTo(self.mainView.safeAreaLayoutGuide.snp.top).offset(20)
        }
        tableview.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalToSuperview()
        }
        buttonView.snp.makeConstraints { make in
            make.bottom.equalTo(self.mainView.safeAreaLayoutGuide.snp.bottom).inset(30)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(60)
        }
//        btn.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
    }
    
}
