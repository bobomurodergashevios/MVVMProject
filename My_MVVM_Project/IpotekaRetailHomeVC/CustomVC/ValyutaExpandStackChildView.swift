//
//  ValyutaExpandStackChildView.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import UIKit

class ValyutaExpandStackChildView: UIView {
    private var titleStackView : UIStackView!
    private var valyutaTitleLbl : UILabel!
    private var sotibOlishLbl : UILabel!
    private var sotishLbl : UILabel!
    private var MBkursLbl : UILabel!
    
    private var usdStackView : UIStackView!
    private var usdLbl : UILabel!
    public var usdsotibolishValue : UILabel!
    public var usdsotishValue : UILabel!
    public var usdMBValue : UILabel!
    
    private var rubStackView : UIStackView!
    private var rublLbl : UILabel!
    public var rublsotibolishValue : UILabel!
    public var rublsotishValue : UILabel!
    public var rublMBValue : UILabel!
    
    private var eurStackView : UIStackView!
    private var euroLbl : UILabel!
    public var eursotibolishValue : UILabel!
    public var eursotishValue : UILabel!
    public var eurMBValue : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        valyutaTitleLbl = UILabel()
        valyutaTitleLbl.text = "Valyuta"
        valyutaTitleLbl.textColor = .gray
        valyutaTitleLbl.font = .systemFont(ofSize: 11)
        
        sotibOlishLbl = UILabel()
        sotibOlishLbl.text = "Sotib olish"
        sotibOlishLbl.textColor = .gray
        sotibOlishLbl.font = .systemFont(ofSize: 11)
        
        sotishLbl = UILabel()
        sotishLbl.text = "Sotib olish"
        sotishLbl.textColor = .gray
        sotishLbl.font = .systemFont(ofSize: 11)
        
        
        MBkursLbl = UILabel()
        MBkursLbl.text = "Sotib olish"
        MBkursLbl.textColor = .gray
        MBkursLbl.font = .systemFont(ofSize: 11)
        
        
        titleStackView = UIStackView(arrangedSubviews: [valyutaTitleLbl,sotibOlishLbl,sotishLbl,MBkursLbl])
        titleStackView.axis = .horizontal
        titleStackView.spacing = 3
        titleStackView.distribution = .equalSpacing
        self.addSubview(titleStackView)
        titleStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(20)
        }
        
        
        
        usdLbl = UILabel()
        usdLbl.text = "USD"
        usdLbl.textColor = .black
        usdLbl.font = .boldSystemFont(ofSize: 13)
        
        usdsotibolishValue = UILabel()
        usdsotibolishValue.text = "11 395"
        usdsotibolishValue.textColor = .black
        usdsotibolishValue.font = .systemFont(ofSize: 13)
        
        usdsotishValue = UILabel()
        usdsotishValue.text = "11 375"
        usdsotishValue.textColor = .black
        usdsotishValue.font = .systemFont(ofSize: 13)
        
        usdMBValue = UILabel()
        usdMBValue.text = "11 318"
        usdMBValue.textColor = .black
        usdMBValue.font = .systemFont(ofSize: 13)
        
        usdStackView = UIStackView(arrangedSubviews: [usdLbl,usdsotibolishValue,usdsotishValue,usdMBValue])
        usdStackView.axis = .horizontal
        usdStackView.spacing = 3
        usdStackView.distribution = .equalSpacing
        usdStackView.addBorder(toSide: .Bottom, withColor: .black , andThickness: 0.2)
//        usdStackView.addBorder(side: .bottom, color: .black, width: 0.2)
        self.addSubview(usdStackView)
        usdStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(titleStackView.snp.bottom).offset(3)
            make.height.equalTo(35)
        }
        
        
        
        rublLbl = UILabel()
        rublLbl.text = "RUB"
        rublLbl.textColor = .black
        rublLbl.font = .boldSystemFont(ofSize: 13)
        
        rublsotibolishValue = UILabel()
        rublsotibolishValue.text = "179"
        rublsotibolishValue.textColor = .black
        rublsotibolishValue.font = .systemFont(ofSize: 13)
        
        rublsotishValue = UILabel()
        rublsotishValue.text = "113"
        rublsotishValue.textColor = .black
        rublsotishValue.font = .systemFont(ofSize: 13)
        
        rublMBValue = UILabel()
        rublMBValue.text = "164"
        rublMBValue.textColor = .black
        rublMBValue.font = .systemFont(ofSize: 13)
        
        rubStackView = UIStackView(arrangedSubviews: [rublLbl,rublsotibolishValue,rublsotishValue,rublMBValue])
        rubStackView.axis = .horizontal
        rubStackView.spacing = 3
        rubStackView.distribution = .equalSpacing
        rubStackView.addBorder(toSide: .Bottom, withColor: .black, andThickness: 0.2)
//        rubStackView.addBorder(side: .bottom, color: .black, width: 0.2)
        self.addSubview(rubStackView)
        rubStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(usdStackView.snp.bottom)
            make.height.equalTo(35)
        }
        
        
        euroLbl = UILabel()
        euroLbl.text = "EUR"
        euroLbl.textColor = .black
        euroLbl.font = .boldSystemFont(ofSize: 13)
        
        eursotibolishValue = UILabel()
        eursotibolishValue.text = "12700"
        eursotibolishValue.textColor = .black
        eursotibolishValue.font = .systemFont(ofSize: 13)
        
        eursotishValue = UILabel()
        eursotishValue.text = "11700"
        eursotishValue.textColor = .black
        eursotishValue.font = .systemFont(ofSize: 13)
        
        eurMBValue = UILabel()
        eurMBValue.text = "12242"
        eurMBValue.textColor = .black
        eurMBValue.font = .systemFont(ofSize: 13)
        
        eurStackView = UIStackView(arrangedSubviews: [euroLbl,eursotibolishValue,eursotishValue,eurMBValue])
        eurStackView.axis = .horizontal
        eurStackView.spacing = 3
        eurStackView.distribution = .equalSpacing
        eurStackView.addBorder(toSide: .Bottom, withColor: .black, andThickness: 0.2)
//        eurStackView.addBorder(side: .bottom, color: .black, width: 0.2)
        self.addSubview(eurStackView)
        eurStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(rubStackView.snp.bottom)
            make.height.equalTo(35)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    convenience init(title : String) {
        self.init()
        
    }
    
}



//    
//public enum BorderMode : String {
//    case Top = "top"
//    case Bottom = "bottom"
//    case Left = "left"
//    case Right = "right"
//}
//
//extension UIView {
//    public func addBorder(side: BorderMode, color: UIColor, width: CGFloat) {
//        let border = UIView()
//        border.translatesAutoresizingMaskIntoConstraints = false
//        border.backgroundColor = color
//        self.addSubview(border)
//
//        let topConstraint = topAnchor.constraint(equalTo: border.topAnchor)
//        let rightConstraint = trailingAnchor.constraint(equalTo: border.trailingAnchor)
//        let bottomConstraint = bottomAnchor.constraint(equalTo: border.bottomAnchor)
//        let leftConstraint = leadingAnchor.constraint(equalTo: border.leadingAnchor)
//        let heightConstraint = border.heightAnchor.constraint(equalToConstant: width)
//        let widthConstraint = border.widthAnchor.constraint(equalToConstant: width)
//
//
//        switch side {
//        case .top:
//            NSLayoutConstraint.activate([leftConstraint, topConstraint, rightConstraint, heightConstraint])
//        case .right:
//            NSLayoutConstraint.activate([topConstraint, rightConstraint, bottomConstraint, widthConstraint])
//        case .bottom:
//            NSLayoutConstraint.activate([rightConstraint, bottomConstraint, leftConstraint, heightConstraint])
//        case .left:
//            NSLayoutConstraint.activate([bottomConstraint, leftConstraint, topConstraint, widthConstraint])
//        }
//    }
//}
