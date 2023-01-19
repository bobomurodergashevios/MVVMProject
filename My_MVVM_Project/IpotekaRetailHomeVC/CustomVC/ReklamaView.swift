//
//  ReklamaView.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 16/01/23.
//

import UIKit

class ReklamaView: UIView {

    var imgView : UIImageView!
    var lbl1 : UILabel!
    var lbl2 : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imgView = UIImageView()
        imgView.image = UIImage(named: "")
        imgView.contentMode = .scaleAspectFit
        self.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        lbl1 = UILabel()
        lbl1.text = "Вклад Qulay"
        lbl1.textColor = .black
        lbl1.font = .boldSystemFont(ofSize: 20)
        self.addSubview(lbl1)
        lbl1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.left.equalToSuperview().offset(40)
            make.width.equalTo(140)
            make.height.equalTo(40)
        }
        
        
        lbl2 = UILabel()
        lbl2.text = "Годовая процентная ставка 22%"
        lbl2.textColor = .black
        lbl2.font = .boldSystemFont(ofSize: 15)
        self.addSubview(lbl2)
        lbl2.snp.makeConstraints { make in
            make.top.equalTo(lbl1.snp.bottom)
            make.left.equalToSuperview().offset(40)
            make.width.equalTo(250)
            make.height.equalTo(40)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
