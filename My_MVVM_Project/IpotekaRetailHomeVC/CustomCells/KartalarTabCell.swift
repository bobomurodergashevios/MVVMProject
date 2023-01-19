//
//  KartalarTabCell.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 17/01/23.
//

import UIKit

class KartalarTabCell: UITableViewCell {

    static let identifier = "KartalarTabCell"
    var expandView: KartalarExpandingView!
    var isSenderExpanded = false
    var isReceiverExpanded = false
    public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?,title : String,count : Int,isPlusAddKarta : Bool) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        expandView = KartalarExpandingView(title: title, count: count, plusBtnTxt: "isPlusAddKarta")
        expandView.makeShadow()
        expandView.backgroundColor = .white
        expandView.layer.cornerRadius = 10
        self.contentView.addSubview(expandView)
        expandView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalToSuperview()
        }
        expandView.moreButton.addTarget(self, action: #selector(onExpandTapped), for: .touchUpInside)
        expandView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onExpandTapped)))
        
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    
    @objc func onExpandTapped() {
        print("tapped....")
        self.senderExpandView(isExpand: self.isSenderExpanded)
    }
    
    func senderExpandView(isExpand: Bool){
        if isExpand {
            isSenderExpanded = false
           
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .transitionCrossDissolve) {
                self.expandView.stackView.alpha = 0
                self.expandView.stackView.isHidden = true
                self.expandView.snp.updateConstraints { make in
                    make.height.equalTo(120)
                }
                self.contentView.layoutIfNeeded()
            }
        } else {
            isSenderExpanded = true
            
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .transitionCrossDissolve) {
                self.expandView.stackView.alpha = 1
                self.expandView.backgroundColor = .yellow
                self.expandView.stackView.isHidden = false
                self.expandView.snp.updateConstraints({ make in
                       make.height.equalTo(200)
                })
//                self.contentView.snp.updateConstraints { make in
//                    make.height.equalTo(300)
//                }
                self.contentView.layoutIfNeeded()
            }
        }
    }
}
