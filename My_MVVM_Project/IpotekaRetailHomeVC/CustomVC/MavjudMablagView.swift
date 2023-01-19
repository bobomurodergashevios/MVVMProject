//
//  MavjudMablagView.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 16/01/23.
//

import UIKit

class MavjudMablagView: UIView {

    private var lbl1 : UILabel!
    private var lbl2 : UILabel!
    private var img1 : UIImageView!
    private var img2 : UIImageView!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        lbl1 = UILabel()
        lbl1.text = "Mavjud mablag'lar"
        lbl1.textColor = .black
        lbl1.font = .boldSystemFont(ofSize: 15)
        self.addSubview(lbl1)
        lbl1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(140)
            make.height.equalTo(40)
        }
        
        
        lbl2 = UILabel()
        lbl2.text = "880.66 UZS"
        lbl2.textColor = .black
        lbl2.font = .boldSystemFont(ofSize: 18)
        self.addSubview(lbl2)
        lbl2.snp.makeConstraints { make in
            make.top.equalTo(lbl1.snp.bottom)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        
        
        img1 = UIImageView()
        img1.image = UIImage(named: "")
        img1.contentMode = .scaleAspectFit
        img1.backgroundColor = .gray
        self.addSubview(img1)
        img1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(45)
            make.right.equalToSuperview().inset(10)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        img2 = UIImageView()
        img2.image = UIImage(named: "")
        img2.contentMode = .scaleAspectFit
        img2.backgroundColor = .gray
        self.addSubview(img2)
        img2.snp.makeConstraints { make in
            make.top.equalTo(img1.snp.bottom).offset(13)
            make.right.equalToSuperview().inset(10)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
