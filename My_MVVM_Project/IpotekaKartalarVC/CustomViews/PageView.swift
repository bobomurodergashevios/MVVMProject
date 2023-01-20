//
//  PageView.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import UIKit

class PageView: UIView {

    private var imgView : UIImageView!
    private var cardTitleLbl : UILabel!
    private var cardBalanceLbl : UILabel!
    
        var model : PageModel! {
            didSet {
                updateView()
            }
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        imgView = UIImageView(frame: CGRect(x: 15, y: 15, width: 100, height: 50))
        imgView.image = UIImage(named: "humo")
        imgView.contentMode = .scaleAspectFill
        imgView.backgroundColor = .gray
        self.addSubview(imgView)
        
        cardTitleLbl = UILabel(frame: CGRect(x: imgView.frame.maxX+5, y: 15, width: 150, height: 20))
        cardTitleLbl.text = "UZCARD CARD SALARY"
        cardTitleLbl.font = .systemFont(ofSize: 18)
        self.addSubview(cardTitleLbl)
        
        cardBalanceLbl = UILabel(frame: CGRect(x: imgView.frame.maxX+5, y: cardTitleLbl.frame.maxY, width: 100, height: 20))
        cardBalanceLbl.text = "419.16 UZS"
        cardBalanceLbl.font = .boldSystemFont(ofSize: 18)
        self.addSubview(cardBalanceLbl)
       
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView() {
        imgView.image = model.cardImg
        cardTitleLbl.text = model.cardTitle
        cardBalanceLbl.text = model.cardBalance
    }
    
}
