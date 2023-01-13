//
//  CalendarDialogController.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 12/01/23.
//

import UIKit

class CalendarDialogController: UIViewController {

    private var baseView : UIView!
    private var datePicker = UIDatePicker()
    private var submitBtn : UIButton!
    var completion : ((String)->Void)?
    var vc : AnketaVC!
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView = UIView(frame: CGRect(x: 0, y: 450, width: self.view.frame.width, height: self.view.frame.height))
        baseView.backgroundColor = UIColor(hex: "#FFF")
        baseView.layer.cornerRadius = 14
        self.view.addSubview(baseView)
        
        datePicker = UIDatePicker()
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
        datePicker.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
        }
        submitBtn = UIButton()
        submitBtn.setTitle("OK", for: .normal)
        submitBtn.setTitleColor(.white, for: .normal)
        submitBtn.backgroundColor = .brown
        submitBtn.layer.cornerRadius = 10
        submitBtn.addTarget(self, action: #selector(onSubmitBtnPressed), for: .touchUpInside)
        self.baseView.addSubview(submitBtn)
        submitBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.top.equalTo(datePicker.snp.bottom).offset(14)
            make.height.equalTo(40)
        }
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
    
    }
    @objc func onSubmitBtnPressed(){
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dataText = dateFormatter.string(from: self.datePicker.date)
        self.completion?("\(dataText)")
        self.dismiss(animated: true)
    }

}
