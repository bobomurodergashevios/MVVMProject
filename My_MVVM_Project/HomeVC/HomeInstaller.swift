//
//  HomeInstaller.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 12/01/23.
//

import UIKit
import ExpandableCell
protocol HomeInstaller : ViewInstaller {
    var expTabLeView : ExpandableTableView! {get set}
}
extension HomeInstaller {
    
    
    func initSubviews() {
        expTabLeView = ExpandableTableView()
        expTabLeView.animation = .automatic
    }
    func embedSubviews() {
        mainView.addSubview(expTabLeView)
    }
    func addSubviewsConstraints() {
        expTabLeView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(200)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(240)
        }
        
    }
}
