//
//  CardViewww.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 10/01/23.
//

import UIKit

enum Cardmode {
    case withCarta
    case withImg
}
class CardViewww: UIView {

    private var titleCard : UILabel!
    
    private var cardLogo : UIImageView!
    private var cardName : UILabel!
    private var cardNumber : UILabel!
    private var cardBalance : UILabel!
    
    private var img : UIImageView!
    private var titleImg : UILabel!
    private var descriptionTitleLbl : UILabel!
    private var btn : UIButton!
    
    init(frame: CGRect,mode : Cardmode) {
        super.init(frame: frame)
        if mode == .withCarta {
            titleCard = UILabel()
            titleCard.text = "Kartalar"
            titleCard.font = .boldSystemFont(ofSize: 14)
            self.addSubview(titleCard)
            titleCard.snp.makeConstraints { make in
                make.left.equalToSuperview().offset(10)
                make.top.equalToSuperview().offset(15)
                make.width.equalTo(100)
                make.height.equalTo(20)
            }
            cardLogo = UIImageView()
            cardLogo.image = UIImage(named: "search")
            cardLogo.contentMode = .scaleAspectFit
            cardLogo.clipsToBounds = true
            cardLogo.layer.cornerRadius = 8
           
            cardName = UILabel()
            cardName.text = "Humo"
            cardName.font = .systemFont(ofSize: 13)
            
            cardNumber = UILabel()
            cardNumber.text = "***1201"
            cardNumber.textColor = .blueGrey
            cardNumber.font = .systemFont(ofSize: 10)
            
            let verStack = UIStackView(arrangedSubviews: [cardName,cardNumber])
            verStack.axis = .vertical
            verStack.distribution = .fill
            verStack.alignment = .fill
            verStack.spacing = 1
            self.addSubview(verStack)
            verStack.snp.makeConstraints { make in
                make.width.height.equalTo(50)
            }
            
            let stackView = UIStackView(arrangedSubviews: [cardLogo,verStack])
            stackView.axis = .vertical
            stackView.alignment = .fill
            stackView.distribution = .fill
            stackView.spacing = 5
            self.addSubview(stackView)
            stackView.snp.makeConstraints { make in
                make.width.equalTo(140)
                make.height.equalTo(80)
            }
        }else if mode == .withImg {
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
