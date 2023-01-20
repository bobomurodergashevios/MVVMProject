//
//  SelectedDataDialog.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 20/01/23.
//

import UIKit
let wwidth : CGFloat = UIScreen.main.bounds.width
enum DataPicMode {
    case first
    case second
}

class SelectedDataDialog: UIViewController {

    private var periodLbl : UILabel!
    private var leftLbl : UILabel!
    private var rightLbl : UILabel!
    private var baseView = UIView()
    private var calendar : UIDatePicker!
    var mode : DataPicMode!
    public var btn1 : UIButton!
    public var btn2 : UIButton!
    
    var cTxt : NSAttributedString {
        let title = NSMutableAttributedString(string: "С",attributes: [.font : UIFont.systemFont(ofSize: 12),.foregroundColor : UIColor.gray])
        return title
    }
    
    var poTxt : NSAttributedString {
        let title = NSMutableAttributedString(string: "ПО",attributes: [.font : UIFont.systemFont(ofSize: 12),.foregroundColor : UIColor.gray])
        return title
    }
    
  
    public var dataChanged : ((String,String) -> Void)?
//    public var data2Changed : ((String) -> Void)?
    var data1 : String = ""
    var data2 : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        baseView = UIView(frame: CGRect(x: 0, y: 250, width: self.view.frame.width, height: self.view.frame.height))
        baseView.backgroundColor = UIColor(hex: "#F7F7F7")
        baseView.layer.cornerRadius = 14
        self.view.addSubview(baseView)
        
        
        periodLbl = UILabel()
        periodLbl.text = "Выберите период"
        periodLbl.textAlignment = .center
        periodLbl.font = .boldSystemFont(ofSize: 22)
        self.baseView.addSubview(periodLbl)
        periodLbl.addBorder(toSide: .Bottom, withColor: .black, andThickness: 10)
        periodLbl.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(70)
        }
        
        leftLbl = UILabel()
        leftLbl.attributedText = cTxt
        leftLbl.font = .boldSystemFont(ofSize: 18)
        leftLbl.textAlignment = .center
        leftLbl.isUserInteractionEnabled = true
        leftLbl.addBorder(toSide: .Bottom, withColor: .gray, andThickness: 0.4)
        leftLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onLeftBtnTapped)))
        self.baseView.addSubview(leftLbl)
        leftLbl.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(periodLbl.snp.bottom)
            make.width.equalTo(wwidth/2)
            make.height.equalTo(90)
        }
        
        rightLbl = UILabel()
        rightLbl.font = .boldSystemFont(ofSize: 18)
        rightLbl.attributedText = poTxt
        rightLbl.textAlignment = .center
        rightLbl.isUserInteractionEnabled = true
        rightLbl.addBorder(toSide: .Bottom, withColor: .gray, andThickness: 0.4)
        rightLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onRightBtnTapped)))
        self.baseView.addSubview(rightLbl)
        
        rightLbl.snp.makeConstraints { make in
            make.top.equalTo(periodLbl.snp.bottom)
            make.right.equalToSuperview()
            make.width.equalTo(wwidth/2)
            make.height.equalTo(90)
        }
        
        
        calendar = UIDatePicker()
        calendar.datePickerMode = .date
        calendar.backgroundColor = UIColor(hex: "#F7F7F7")
        calendar.maximumDate = Date()
        if #available(iOS 13.4, *) {
            calendar.preferredDatePickerStyle = .wheels
        } else {
        }
        calendar.timeZone = NSTimeZone.local
        calendar.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        self.baseView.addSubview(calendar)
        calendar.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(170)
            make.top.equalTo(rightLbl.snp.bottom).offset(30)
            
        }
        
        
        btn1 = UIButton()
        btn1.backgroundColor = UIColor(hex: "#EAF6EF")
        btn1.layer.cornerRadius = 12
        btn1.setTitle("Готово", for: .normal)
        btn1.setTitleColor(UIColor(hex: "#2AA65C"), for: .normal)
        btn1.addTarget(self, action: #selector(onBtn1(_:)), for: .touchUpInside)
        btn1.titleLabel?.font = .boldSystemFont(ofSize: 18)
        baseView.addSubview(btn1)
        btn1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.top.equalTo(calendar.snp.bottom).offset(10)
        }
        
        btn2 = UIButton()
        btn2.backgroundColor = .white
        btn2.setTitle("Отмена", for: .normal)
        btn2.setTitleColor(UIColor(hex: "#2AA65C"), for: .normal)
        btn2.layer.cornerRadius = 12
        btn2.addTarget(self, action: #selector(onBtn2), for: .touchUpInside)
        btn2.titleLabel?.font = .boldSystemFont(ofSize: 18)
        self.baseView.addSubview(btn2)
        btn2.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.top.equalTo(btn1.snp.bottom).offset(10)
        }
        
    }
    @objc func onBtn1(_ sender : UIButton) {
      
        self.dataChanged?(self.data1,self.data2)
        self.dismiss(animated: true)
        
        
    }
    @objc func onBtn2(_ sender : UIButton){
        self.dismiss(animated: true)
    }
    
    
    @objc func onLeftBtnTapped(){
        leftLbl.addBorder(toSide: .Bottom, withColor: .brown, andThickness: 1.5)
        rightLbl.removeBorder(toSide: .Bottom)
        self.mode = .first
    }
    
    
    @objc func onRightBtnTapped(){
        rightLbl.addBorder(toSide: .Bottom, withColor: .brown, andThickness: 1.5)
        leftLbl.removeBorder(toSide: .Bottom)

        self.mode = .second
    }
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        switch self.mode {
        case .first:
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let selectedDate: String = dateFormatter.string(from: sender.date)
            var leftTxt : NSAttributedString {
                let title = NSMutableAttributedString(string: "С ",attributes: [.font : UIFont.systemFont(ofSize: 18),.foregroundColor : UIColor.gray])
                title.append(NSAttributedString(string: "\(selectedDate)",attributes: [.font:UIFont.boldSystemFont(ofSize: 19),.foregroundColor:UIColor.black]))
                return title
            }
            leftLbl.attributedText = leftTxt
            self.data1 = selectedDate
        case .second:
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let selectedDate: String = dateFormatter.string(from: sender.date)
            
            var rightTxt : NSAttributedString {
                let title = NSMutableAttributedString(string: "ПО ",attributes: [.font : UIFont.systemFont(ofSize: 18),.foregroundColor : UIColor.gray])
                title.append(NSAttributedString(string: "\(selectedDate)",attributes: [.font:UIFont.boldSystemFont(ofSize: 19),.foregroundColor:UIColor.black]))
                return title
            }
            rightLbl.attributedText = rightTxt
            self.data2 = selectedDate
        case .none: break
                
        }
        
    }
}
