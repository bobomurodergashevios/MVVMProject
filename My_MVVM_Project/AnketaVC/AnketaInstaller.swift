//
//  AnketaInstaller.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 12/01/23.
//

import Foundation
import UIKit
protocol AnketaInstallerLogic : ViewInstaller {
    var tabView : UITableView! {get set}
}

extension AnketaInstallerLogic {
    
    func initSubviews() {
        tabView = UITableView()
        tabView.separatorStyle = .none
        
    }
    
    func embedSubviews() {
        mainView.addSubview(tabView)
    }
    
    func addSubviewsConstraints() {
        tabView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.top.equalTo(self.mainView.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.mainView.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
