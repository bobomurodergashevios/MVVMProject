//
//  MainOperationsView.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 09/01/23.
//

import UIKit

class MainOperationView: UIView {

    
   
    private var myCardImg : UIImageView!
    private var myCard : UILabel!
    
    init(frame: CGRect,img : UIImage?,title : String) {
        super.init(frame: frame)
        myCardImg = UIImageView()
        myCardImg.image = img
        myCardImg.contentMode = .scaleAspectFit
        self.addSubview(myCardImg)
        myCardImg.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        myCard = UILabel()
        myCard.text = title
        myCard.font = .systemFont(ofSize: 12)
        myCard.numberOfLines = -1
        myCard.textAlignment = .center
        self.addSubview(myCard)
        myCard.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model : MainOperationDM! {
        didSet {
            myCardImg.image = UIImage(named: "\(model.img)")
            myCard.text = model.title
        }
    }
    
}
