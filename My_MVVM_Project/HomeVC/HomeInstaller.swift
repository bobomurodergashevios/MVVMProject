//
//  HomeInstaller.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 12/01/23.
//

import UIKit
import ExpandableCell
protocol HomeInstaller : ViewInstaller {
    var baseView : UIView! {get set}
    var expandView : ExpandingViewww! {get set}
    var fikrView : UIView! {get set}
    var fikrLbl : UILabel! {get set}
}
extension HomeInstaller {
    
    
    func initSubviews() {
//        baseView = UIView()
//        baseView.makeShadow()
//        baseView.layer.cornerRadius = 12
//        baseView.backgroundColor = .white
        
        expandView = ExpandingViewww(title: "ExpandingView")
        expandView.makeShadow()
        expandView.layer.cornerRadius = 12
        expandView.backgroundColor = .white
        
        fikrView = UIView()
        fikrView.makeShadow()
        fikrView.layer.cornerRadius = 12
        fikrView.backgroundColor = .white
        
        fikrLbl = UILabel()
        fikrLbl.text = "Fikr va mulohazalar"
        fikrLbl.textAlignment = .left
        fikrLbl.textColor = .black
        fikrLbl.font = .boldSystemFont(ofSize: 16)
       
        
    }
    func embedSubviews() {
        mainView.addSubview(expandView)
        mainView.addSubview(fikrView)
        fikrView.addSubview(fikrLbl)


    }
    func addSubviewsConstraints() {
        expandView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.top.equalTo(mainView.safeAreaLayoutGuide.snp.top).offset(10)
            make.height.equalTo(100)
        }
        
        fikrView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.top.equalTo(expandView.snp.bottom).offset(20)
            make.height.equalTo(100)
        }
        fikrLbl.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.width.equalTo(200)
            make.centerY.equalToSuperview()
        }
    }
}
