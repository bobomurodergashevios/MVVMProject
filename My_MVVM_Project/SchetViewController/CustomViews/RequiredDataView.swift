//
//  RequiredDataView.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 20/01/23.
//
import UIKit
class RequiredDataView : UIView {

   
    
    public var data1Lbl : UILabel!
    public var data2Lbl : UILabel!

    public var dataBtn : UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        data1Lbl = UILabel()
        data1Lbl.text = "12.23.2019"
        data1Lbl.textColor = .black
        data1Lbl.font = .boldSystemFont(ofSize: 16)
        self.addSubview(data1Lbl)
        data1Lbl.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(100)
            make.centerY.equalToSuperview()
            make.height.equalTo(20)
        }
        
        data2Lbl = UILabel()
        data2Lbl.text = "19.09.2022"
        data2Lbl.textColor = .black
        data2Lbl.font = .boldSystemFont(ofSize: 16)
        self.addSubview(data2Lbl)
        data2Lbl.snp.makeConstraints { make in
            make.left.equalTo(data1Lbl.snp.right)
            make.width.equalTo(100)
            make.centerY.equalToSuperview()
            make.height.equalTo(20)
        }
        
        dataBtn = UIButton()
        dataBtn.setImage(UIImage(named: "Filter"), for: .normal)
        dataBtn.backgroundColor = .clear
        self.addSubview(dataBtn)
        dataBtn.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(10)
            make.width.equalTo(30)
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
