//
//  PLVCInstaller.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 28/12/22.
//

import UIKit
protocol PLVCInstallerLogic : ViewInstaller {
    var providenView : ProvedyonView! {get set}
    
    
}
extension PLVCInstallerLogic {
    
    func initSubviews() {
        providenView = ProvedyonView()
        providenView.backgroundColor = .clear
    }
    
    func embedSubviews() {
        mainView.addSubview(providenView)
    }
    
    func addSubviewsConstraints() {
        providenView.snp.makeConstraints { make in
            make.top.equalTo(self.mainView.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(200)
        }
        
    }
}
