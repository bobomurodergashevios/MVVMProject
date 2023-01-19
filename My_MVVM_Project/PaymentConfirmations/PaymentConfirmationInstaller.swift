//
//  PaymentConfirmationInstaller.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 13/01/23.
//

import UIKit

protocol PaymentConfirmationViewInstaller: ViewInstaller {
    var scrollView: UIScrollView! { get set }
    var mainStackView: UIStackView! { get set }
    var headerLabel: UILabel! { get set }
    var senderView: ExpandingViewww! { get set }
    var receiverView: ExpandingViewww! { get set }
    var amountView: UIView! { get set }
    var amountLabel: UILabel! { get set }
    var downButton: UIButton! { get set }
    var infoStackView: UIStackView! { get set }
    var numberTextField: FloatingTextFieldView! { get set }
    var amountTextField: FloatingTextFieldView! { get set }
    var writtenAmountField: MaterialMultilineOutlinedView! { get set }
//    var spaceView: UIView! { get set }
    var paymentCodeField: MaterialMultilineOutlinedView! { get set }
//    var spaceView2: UIView! { get set }
    var paymentReasonField: MaterialMultilineOutlinedView! { get set }
    var switchView: UIView! { get set }
    var switchLabel: UILabel! { get set }
    var switchButton: UISwitch! { get set }
    var confirmButton: UIButton! { get set }
}

extension PaymentConfirmationViewInstaller {
    func initSubviews() {
        self.mainView.backgroundColor = UIColor(hex: "F7F7F7")
        
        scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.spacing = 15
        mainStackView.distribution = .fill
        mainStackView.alignment = .fill
        
        headerLabel = UILabel()
        headerLabel.text = "Проверьте введенные данные"
        headerLabel.font = .systemFont(ofSize: 16, weight: .bold)
        headerLabel.textAlignment = .left
        
        senderView = ExpandingViewww(title: "Плательщик")
        receiverView = ExpandingViewww(title: "Получатель")
        
        amountView = UIView()
        amountView.backgroundColor = .clear
        
        amountLabel = UILabel()
        amountLabel.text = "Сумма платежа"
        amountLabel.textAlignment = .left
        amountLabel.font = .boldSystemFont(ofSize: 14)
        amountLabel.textColor = .primaryText
        amountLabel.isUserInteractionEnabled = true
        
        downButton = UIButton()
        downButton.setImage(UIImage(named: "arrows_down"), for: .normal)
        downButton.imageView?.contentMode = .scaleAspectFit
        
        infoStackView = UIStackView()
        infoStackView.axis = .vertical
        infoStackView.distribution = .fill
        infoStackView.alignment = .fill
        infoStackView.spacing = 6
        
        numberTextField = FloatingTextFieldView()
        numberTextField.setPlaceholder(name: "Номер")
        numberTextField.textField.isEnabled = false
                
        amountTextField = FloatingTextFieldView()
        amountTextField.setPlaceholder(name: "Сумма платежа")
        amountTextField.textField.isEnabled = false
        
        writtenAmountField = MaterialMultilineOutlinedView()
        writtenAmountField.setPlaceholder(name: "Сумма прописью")
        writtenAmountField.textField.isEditable = false
        writtenAmountField.textField.isScrollEnabled = true
//        spaceView = UIView()
//        spaceView.backgroundColor = .clear
        
        paymentCodeField = MaterialMultilineOutlinedView()
        paymentCodeField.setPlaceholder(name: "Код платежа")
        paymentCodeField.textField.isEditable = false
//
//        spaceView2 = UIView()
//        spaceView2.backgroundColor = .clear
        
        paymentReasonField = MaterialMultilineOutlinedView()
        paymentReasonField.setPlaceholder(name: "Назначение платежа")
        paymentReasonField.textField.isEditable = false
        paymentReasonField.textField.isScrollEnabled = true
        
        switchView = UIView()
        switchView.backgroundColor = .clear

        switchLabel = UILabel()
        switchLabel.text = "Через Anor"
        switchLabel.textAlignment = .left
        switchLabel.font = .boldSystemFont(ofSize: 16)
        switchLabel.textColor = .primaryText
        
        switchButton = UISwitch()
        switchButton.isOn = false
        switchButton.onTintColor = UIColor(hex: "#026223")
        switchButton.isUserInteractionEnabled = false
        
//        confirmButton = Button(method: .network, style: .general)
//        confirmButton.setup(title: nil)
//        confirmButton.setGradientColor()
    }
    
    func embedSubviews() {
        mainView.addSubview(scrollView)
        scrollView.addSubview(headerLabel)
        scrollView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(senderView)
        mainStackView.addArrangedSubview(receiverView)
        mainStackView.addArrangedSubview(amountView)
        amountView.addSubview(amountLabel)
        amountView.addSubview(downButton)
        amountView.addSubview(infoStackView)
        infoStackView.addArrangedSubview(numberTextField)
        infoStackView.addArrangedSubview(amountTextField)
        infoStackView.addArrangedSubview(writtenAmountField)
//        infoStackView.addArrangedSubview(spaceView)
        infoStackView.addArrangedSubview(paymentCodeField)
//        infoStackView.addArrangedSubview(spaceView2)
        infoStackView.addArrangedSubview(paymentReasonField)
        infoStackView.addArrangedSubview(switchView)
        switchView.addSubview(switchLabel)
        switchView.addSubview(switchButton)
//        mainView.addSubview(confirmButton)
    }
    
    func addSubviewsConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(mainView.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(mainView.safeAreaLayoutGuide.snp.bottom).inset(75)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.height.equalTo(25)
            make.centerX.equalToSuperview()
        }
        
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(15)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        senderView.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        receiverView.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        
        amountView.snp.makeConstraints { make in
            make.height.equalTo(590)
        }
        amountLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview()
            make.height.equalTo(25)
        }
        downButton.snp.makeConstraints { make in
            make.centerY.equalTo(amountLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(15)
            make.width.height.equalTo(20)
        }
        infoStackView.snp.makeConstraints { make in
            make.top.equalTo(amountLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        numberTextField.snp.makeConstraints { make in
            make.height.equalTo(84)
        }
        amountTextField.snp.makeConstraints { make in
            make.height.equalTo(84)
        }
        writtenAmountField.snp.makeConstraints { make in
            make.height.equalTo(110)
        }
//        spaceView.snp.makeConstraints { make in
//            make.height.equalTo(5)
//        }
//        spaceView2.snp.makeConstraints { make in
//            make.height.equalTo(5)
//        }
        paymentCodeField.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
        paymentReasonField.snp.makeConstraints { make in
            make.height.equalTo(110)
        }
        switchView.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        switchLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.height.equalTo(20)
        }
        switchButton.snp.makeConstraints { make in
            make.centerY.equalTo(switchLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(30)
            make.width.equalTo(40)
            make.height.equalTo(20)
        }
        
//        confirmButton.snp.makeConstraints { make in
//            make.bottom.equalTo(mainView.safeAreaLayoutGuide.snp.bottom).inset(15)
//            make.leading.equalToSuperview().offset(15)
//            make.trailing.equalToSuperview().inset(15)
//            make.height.equalTo(50)
//        }
    }
}
