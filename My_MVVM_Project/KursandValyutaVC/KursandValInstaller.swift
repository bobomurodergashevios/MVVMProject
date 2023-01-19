//
//  KursAndValyutaViewInstaller.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 27/12/22.
//

import UIKit
protocol KursAndValyutaViewInstallerLogic : ViewInstaller {
    var stackView : UIStackView! {get set}
    var segmentControl : UISegmentedControl! {get set}
    var tableview : UITableView! {get set}
}
extension KursAndValyutaViewInstallerLogic {
    func initSubviews() {
        
        stackView = UIStackView()
        stackView.axis = .vertical
        
        segmentControl = UISegmentedControl(items: ["ЦБ","ФЛ","ЮЛ"])
        segmentControl.selectedSegmentIndex = 0
        segmentControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for:
                .normal)
        if #available(iOS 13.0, *) {
            segmentControl.selectedSegmentTintColor = UIColor(hex: "#2AA65C")
        }
        
        tableview = UITableView(frame: .zero, style: .plain)
        tableview.separatorStyle = .none
        
    }
    func embedSubviews() {
        mainView.addSubview(stackView)
        
        stackView.addArrangedSubview(segmentControl)
        stackView.addArrangedSubview(tableview)
    }
    func addSubviewsConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(self.mainView.safeAreaLayoutGuide.snp.top).offset(30)
            make.bottom.equalTo(self.mainView.safeAreaLayoutGuide.snp.bottom)
            make.left.right.equalToSuperview()
        }
    }
}
