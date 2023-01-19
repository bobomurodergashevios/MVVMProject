//
//  ViewController.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 26/12/22.
//

import UIKit

enum Mode {
    case first
    case second
}

class DPICKERViewController: UIViewController {
    private var titleLBL : UILabel!
    var iksBtn : UIButton!
    private var baseView : UIView!
    private var firstDataBtn : UIButton!
    private var secondDataBtn : UIButton!
    private var datePicker: UIDatePicker!
    private var btn1 : UIButton!
    private var btn2 : UIButton!
    private var mode: Mode = .first
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView = UIView(frame: CGRect(x: 0, y: 250, width: self.view.frame.width, height: self.view.frame.height))
        baseView.backgroundColor = .white
        baseView.layer.cornerRadius = 14
        self.view.addSubview(baseView)
        
        titleLBL = UILabel(frame: CGRect(x: 115, y: 10, width: baseView.frame.width-220, height: 30))
        titleLBL.text = "Выберите период"
        titleLBL.textColor = .black
        titleLBL.font = .boldSystemFont(ofSize: 19)
        baseView.addSubview(titleLBL)
        
        iksBtn = UIButton(frame: CGRect(x: titleLBL.frame.maxX+60, y: 10, width: 30, height: 30))
        iksBtn.setImage(UIImage(named: "Close"), for: .normal)
        iksBtn.layer.cornerRadius = 15
        iksBtn.backgroundColor = UIColor(hex: "#F7F7F7")
        baseView.addSubview(iksBtn)
        iksBtn.addTarget(self, action: #selector(iksTapped), for: .touchUpInside)
        
        firstDataBtn = UIButton(frame: CGRect(x: 70, y: titleLBL.frame.maxY, width: 100, height: 50))
        firstDataBtn.setTitle("С: ", for: .normal)
        firstDataBtn.setTitleColor(.black, for: .normal)
        firstDataBtn.addTarget(self, action: #selector(firstTouch(_:)), for: .touchUpInside)
        baseView.addSubview(firstDataBtn)
        
        secondDataBtn = UIButton(frame: CGRect(x: firstDataBtn.frame.maxX+60, y: titleLBL.frame.maxY, width: 100, height: 50))
        secondDataBtn.setTitleColor(.black, for: .normal)
        secondDataBtn.setTitle("ПО: ", for: .normal)
        secondDataBtn.addTarget(self, action: #selector(secondTouch(_:)), for: .touchUpInside)
        baseView.addSubview(secondDataBtn)
        
        datePicker = UIDatePicker(frame: CGRect(x: 40, y: secondDataBtn.frame.maxY+30, width: self.baseView.frame.width-20, height: self.baseView.frame.height-30))
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = UIColor(hex: "#F7F7F7")
        datePicker.maximumDate = Date()
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
        }
        datePicker.timeZone = NSTimeZone.local
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        self.baseView.addSubview(datePicker)
        
        
        btn1 = UIButton(frame: CGRect(x: 20, y: datePicker.frame.maxY+30, width: baseView.frame.width-40, height: 40))
        btn1.backgroundColor = UIColor(hex: "#EAF6EF")
        btn1.layer.cornerRadius = 12
        btn1.setTitle("Готово", for: .normal)
        btn1.setTitleColor(UIColor(hex: "#2AA65C"), for: .normal)
        btn1.titleLabel?.font = .boldSystemFont(ofSize: 18)
        btn1.addTarget(self, action: #selector(onBtn1), for: .touchUpInside)
        baseView.addSubview(btn1)
        
        
        btn2 = UIButton(frame: CGRect(x: 10, y: btn1.frame.maxY, width: baseView.frame.width-20, height: 40))
        btn2.backgroundColor = .white
        btn2.setTitle("Отмена", for: .normal)
        btn2.setTitleColor(UIColor(hex: "#2AA65C"), for: .normal)
        btn2.addTarget(self, action: #selector(onBtn2), for: .touchUpInside)
        btn2.titleLabel?.font = .boldSystemFont(ofSize: 18)
        
        baseView.addSubview(btn2)
        
        
        
    }
    
    
    @objc func firstTouch(_ sender : UIButton) {
        firstDataBtn.backgroundColor = UIColor(hex: "#F7F7F7")
        secondDataBtn.backgroundColor = .clear
        self.mode = .first
    }
    
    @objc func secondTouch(_ sender : UIButton) {
        //        self.datePicker.date = Date()
        secondDataBtn.backgroundColor =  UIColor(hex: "#F7F7F7")
        firstDataBtn.backgroundColor = .clear
        self.mode = .second
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        switch self.mode {
        case .first:
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let selectedDate: String = dateFormatter.string(from: sender.date)
            firstDataBtn.setTitle(selectedDate, for: .normal)
        case .second:
            let dateFormatter: DateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let selectedDate: String = dateFormatter.string(from: sender.date)
            secondDataBtn.setTitle(selectedDate, for: .normal)
        }
        
    }
    
    @objc func onBtn1(){
        print("done")
        print("Selected value C \(firstDataBtn.titleLabel?.text ?? "")")
        print("Selected value ПО \(secondDataBtn.titleLabel?.text ?? "")")
        self.dismiss(animated: true)
    }
    
    @objc func onBtn2(){
        print("cancel")
        self.dismiss(animated: true)
    }
    
    @objc func iksTapped(){
        self.dismiss(animated: true)
    }
}
