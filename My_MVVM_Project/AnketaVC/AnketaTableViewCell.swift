//
//  AnketaTableViewCell.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 12/01/23.
//

import UIKit

class AnketaTableViewCell: UITableViewCell {
    static let identifier = "AnketaTableViewCell"
    
    var model : AnketaDM! {
        didSet {
            updateCell()
        }
    }
    private var container : UIView!
    private var datePicker : UIDatePicker!
    var datePickerBtn : UIButton!
    var datePickerLbl : UILabel!
    private var carNumberLbl : UILabel!
    private var cardNameLbl : UILabel!
    private var summaLbl : UILabel!
    private var fullnameLbl : UILabel!
    var pickerButtonArray : [UIButton] = []
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor(hex: "#F7F7F7")
        container = UIView()
        container.makeShadow()
        container.backgroundColor = .white
        container.layer.cornerRadius = 12
        contentView.addSubview(container)
        container.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().inset(5)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(8)
        }
        datePickerBtn = UIButton()
        datePickerBtn.setImage(UIImage(named: "calendar"), for: .normal)
        self.container.addSubview(datePickerBtn)
        pickerButtonArray.append(datePickerBtn)
//        datePickerBtn.addTarget(self, action: #selector(onBtnClicked), for: .touchUpInside)
        
        datePickerBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(5)
            make.width.height.equalTo(20)
        }
        
        datePickerLbl = UILabel()
        datePickerLbl.text = "11.09.2022"
        datePickerLbl.font = .boldSystemFont(ofSize: 13)
        self.container.addSubview(datePickerLbl)
        datePickerLbl.snp.makeConstraints { make in
            make.left.equalTo(self.datePickerBtn.snp.right).offset(10)
            make.top.equalToSuperview().offset(5)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
       
        carNumberLbl = UILabel()
        carNumberLbl.text = "eeeeeeeee"
        carNumberLbl.textColor = UIColor.brown
        carNumberLbl.font = .systemFont(ofSize: 13)
        carNumberLbl.textAlignment = .right
        container.addSubview(carNumberLbl)
        carNumberLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(5)
            make.width.equalTo(80)
            make.height.equalTo(20)
        }
        cardNameLbl = UILabel()
        cardNameLbl.text = "Chevrolet Spark V12 Sedan"
        cardNameLbl.textColor = UIColor.brown
        cardNameLbl.font = .systemFont(ofSize: 12)
        cardNameLbl.textAlignment = .right
        container.addSubview(cardNameLbl)
        cardNameLbl.snp.makeConstraints { make in
            make.top.equalTo(carNumberLbl.snp.bottom)
            make.right.equalToSuperview().inset(5)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        summaLbl = UILabel()
        summaLbl.text = "56000sum"
        summaLbl.textColor = UIColor.black
        summaLbl.font = .boldSystemFont(ofSize: 14)
        summaLbl.textAlignment = .right
        container.addSubview(summaLbl)
        summaLbl.snp.makeConstraints { make in
            make.top.equalTo(cardNameLbl.snp.bottom)
            make.right.equalToSuperview().inset(5)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        fullnameLbl = UILabel()
        fullnameLbl.text = "Safarxonov Majidilloxon Davirxonovich".uppercased()
        fullnameLbl.textColor = UIColor.black
        fullnameLbl.font = .systemFont(ofSize: 13)
        fullnameLbl.numberOfLines = -1
        fullnameLbl.lineBreakMode = .byWordWrapping
//        fullnameLbl.minimumScaleFactor = 0.8
//        fullnameLbl.textAlignment = .left
        container.addSubview(fullnameLbl)
        fullnameLbl.snp.makeConstraints { make in
            make.top.equalTo(summaLbl.snp.bottom)
            make.centerX.equalToSuperview().offset(30)
            make.width.equalTo(230)
            make.height.equalTo(40)
        }
        
        
    }
    
       
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
//
//    }
    
//    @objc func onBtnClicked(){
////        print("zdddd")
////        self.datePickerLbl.text = "llll"
//
//    }
    
    func updateCell(){

        carNumberLbl.text = model.carNumber.uppercased()
        cardNameLbl.text = model.carName.uppercased()
        summaLbl.text = model.summa.uppercased()
        fullnameLbl.text = model.fullname.uppercased()

    }
    
}
