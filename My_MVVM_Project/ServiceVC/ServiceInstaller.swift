//
//  ServicesViewInstaller.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 21/12/22.
//

import UIKit

protocol ServicesViewInstallerLogic : ViewInstaller {
    var tableview : UITableView! {get set}
}

extension ServicesViewInstallerLogic {
    
    func initSubviews() {
        self.mainView.backgroundColor = .white
        tableview = UITableView(frame: .zero, style: .plain)
        tableview.separatorStyle = .none
        tableview.showsVerticalScrollIndicator = false
//        tableview.isScrollEnabled = true
    }
    func embedSubviews() {
        mainView.addSubview(tableview)
    }
    func addSubviewsConstraints() {
        
        tableview.snp.makeConstraints { make in
            make.top.equalTo(mainView.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(mainView.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
}
