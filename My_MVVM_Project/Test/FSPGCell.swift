//
//  File.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 09/01/23.
//

import UIKit
import FSPagerView

class PagerViewCell : FSPagerViewCell {
    var modeBlock : ((Int) -> Void)?

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        for sb in self.contentView.subviews {
            sb.removeFromSuperview()
        }
        self.contentView.backgroundColor = .clear
        self.contentView.layer.shadowOffset = CGSize(width: 0 , height: 0)
        self.contentView.layer.shadowColor = UIColor.clear.cgColor
        self.contentView.layer.cornerRadius = 0.0
        self.contentView.layer.shadowRadius = 0.0
        self.contentView.layer.shadowOpacity = 0.0
        for sb in self.contentView.subviews {
            sb.removeFromSuperview()
        }
        let cardView = CardView()
        cardView.makeShadow()
        self.modeBlock = { index in
            cardView.completion?(index)
        }
//        cardView.backgroundColor = .clear
        self.contentView.addSubview(cardView)
        cardView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
//            make.height.equalTo(160)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
