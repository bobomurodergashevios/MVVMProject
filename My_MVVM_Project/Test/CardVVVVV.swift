//
//  CardView.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 09/01/23.
//

import UIKit

class CardView: UIView {

    var completion : ((Int)->Void)?
    private let obshiyBalansLbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Obshiy balans"
        lbl.textColor = .gray
        lbl.font = .systemFont(ofSize: 12)
        return lbl
    }()
    private let amountBalansLbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "44 034 434 sum"
        lbl.textColor = .gray
        lbl.font = .boldSystemFont(ofSize: 18)
        return lbl
    }()
    private let valyutaLbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Valyuta $"
        lbl.textColor = .black
        lbl.font = .boldSystemFont(ofSize: 11)
        return lbl
    }()
    private let pokupkaLbl : UILabel = {
        let lbl = UILabel()
//        let title = NSMutableAttributedString(string: "Pokupka: ")
//        title.append(NSAttributedString(string: "10 394 sum"))
        lbl.text = "Pokupka 10 223 sum"
        lbl.textColor = .gray
        lbl.font = .systemFont(ofSize: 11)
        return lbl
    }()
    
    private let kursValBtn : UIButton = {
       let btn = UIButton()
        btn.setTitle("Kurs valyut", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .brown
        btn.layer.cornerRadius = 7
        btn.titleLabel?.font = .boldSystemFont(ofSize: 11)
        return btn
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
//        modeBlock = { number in
          
//            print(number)
//        }
       
        
        self.addSubview(obshiyBalansLbl)
        obshiyBalansLbl.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(120)
            make.height.equalTo(20)
        }
        
        self.addSubview(amountBalansLbl)
        amountBalansLbl.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(obshiyBalansLbl.snp.bottom)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        self.addSubview(valyutaLbl)
        valyutaLbl.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(amountBalansLbl.snp.bottom)
            make.width.equalTo(120)
            make.height.equalTo(20)
        }
        
        self.addSubview(pokupkaLbl)
        pokupkaLbl.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(valyutaLbl.snp.bottom)
            make.width.equalTo(190)
            make.height.equalTo(20)
        }
        
        self.addSubview(kursValBtn)
        kursValBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(pokupkaLbl.snp.bottom).offset(10)
            make.width.equalTo(70)
            make.height.equalTo(18)
        }
        self.completion = { [self] index in
            print("_____---- \(index)")
            if index == 0 {
                self.backgroundColor = .clear
            }else{
                self.clipsToBounds = true
                self.layer.cornerRadius = 12
                self.backgroundColor = UIColor(hex: "#338C34")
                self.obshiyBalansLbl.textColor = .white
                amountBalansLbl.textColor = .white
                valyutaLbl.textColor = .white
                pokupkaLbl.textColor = .white
                kursValBtn.isHidden = true
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
