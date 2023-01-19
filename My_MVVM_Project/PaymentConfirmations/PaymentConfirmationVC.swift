//
//  PaymentConfirmationVC.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 13/01/23.
//

import UIKit

protocol PaymentConfirmationDisplayLogic: PaymentConfirmationViewInstaller {
    func setupTargets()
}


class PaymentConfirmationViewController: BaseViewController, PaymentConfirmationDisplayLogic  {
//    var mainView: UIView!
    
    var scrollView: UIScrollView!
    var mainStackView: UIStackView!
    var headerLabel: UILabel!
    var senderView: ExpandingViewww!
    var receiverView: ExpandingViewww!
    var confirmButton: UIButton!
    var amountView: UIView!
    var amountLabel: UILabel!
    var downButton: UIButton!
    var infoStackView: UIStackView!
    var numberTextField: FloatingTextFieldView!
    var amountTextField: FloatingTextFieldView!
    var writtenAmountField: MaterialMultilineOutlinedView!
    var paymentCodeField: MaterialMultilineOutlinedView!
    var paymentReasonField: MaterialMultilineOutlinedView!
    var switchView: UIView!
    var switchLabel: UILabel!
    var switchButton: UISwitch!
    var spaceView: UIView!
    var spaceView2: UIView!
    
    var mainView: UIView! { self.view }
    var presenter: PaymentConfirmationPresentationLogic!
    
    var isSenderExpanded = true
    var isReceiverExpanded = true
    var isAmountExpanded = true
    var receiverPinfl = false
    var senderPinfl = false
    
    override func loadView() {
        super.loadView()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear(animated)
    }
    
    func setupTargets() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onExpandTapped))
        senderView.moreButton.addTarget(self, action: #selector(onExpandTapped), for: .touchUpInside)
        senderView.headerLabel.addGestureRecognizer(gesture)
        let receiverGesture = UITapGestureRecognizer(target: self, action: #selector(onReceiverExpand))
        receiverView.moreButton.addTarget(self, action: #selector(onReceiverExpand), for: .touchUpInside)
        receiverView.headerLabel.addGestureRecognizer(receiverGesture)
        let amountGesture = UITapGestureRecognizer(target: self, action: #selector(onAmountExpand))
        amountLabel.addGestureRecognizer(amountGesture)
        downButton.addTarget(self, action: #selector(onAmountExpand), for: .touchUpInside)
//        confirmButton.addTarget(self, action: #selector(onNextClicked), for: .touchUpInside)
    }
    
    //MARK: - Objc funcs for gestures, buttons and textField callbacks
    @objc private func onNextClicked() {
//        presenter.continuePaymentConfirm()
    }
    @objc private func onExpandTapped(){
        self.senderExpandView(isExpand: self.isSenderExpanded, hasPinfl: self.senderPinfl)
    }
    @objc private func onReceiverExpand(){
        self.receiverExpandView(isExpand: self.isReceiverExpanded, hasPinfl: self.receiverPinfl)
    }
    @objc private func onAmountExpand(){
        self.amountExpandView(isExpand: self.isAmountExpanded)
    }
    
    func senderExpandView(isExpand: Bool, hasPinfl: Bool){
        if isExpand {
            isSenderExpanded = false
            self.senderView.snp.updateConstraints { make in
                make.height.equalTo(30)
            }
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .transitionCrossDissolve) {
                self.senderView.stackView.alpha = 0
                self.senderView.stackView.isHidden = true
                self.mainView.layoutIfNeeded()
            }
        } else {
            isSenderExpanded = true
            if hasPinfl {
                self.senderView.snp.updateConstraints { make in
                    make.height.equalTo(530)
                }
            } else {
                self.senderView.snp.updateConstraints { make in
                    make.height.equalTo(445)
                }
            }
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .transitionCrossDissolve) {
                self.senderView.stackView.alpha = 1
                self.senderView.stackView.isHidden = false
                self.mainView.layoutIfNeeded()
            }
        }
    }
    
    func receiverExpandView(isExpand: Bool, hasPinfl: Bool){
        if isExpand {
            isReceiverExpanded = false
            self.receiverView.snp.updateConstraints { make in
                make.height.equalTo(30)
            }
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .transitionCrossDissolve) {
                self.receiverView.stackView.alpha = 0
                self.receiverView.stackView.isHidden = true
                self.mainView.layoutIfNeeded()
            }
        } else {
            isReceiverExpanded = true
            if hasPinfl {
                self.receiverView.snp.updateConstraints { make in
                    make.height.equalTo(530)
                }
            } else {
                self.receiverView.snp.updateConstraints { make in
                    make.height.equalTo(445)
                }
            }
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .transitionCrossDissolve) {
                self.receiverView.stackView.alpha = 1
                self.receiverView.stackView.isHidden = false
                self.mainView.layoutIfNeeded()
            }
        }
    }
    
    func amountExpandView(isExpand: Bool){
        if isExpand {
            isAmountExpanded = false
            self.amountView.snp.updateConstraints { make in
                make.height.equalTo(30)
            }
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .transitionCrossDissolve) {
                self.infoStackView.alpha = 0
                self.mainView.layoutIfNeeded()
            }
        } else {
            isAmountExpanded = true
            self.amountView.snp.updateConstraints { make in
                make.height.equalTo(590)
            }
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .transitionCrossDissolve) {
                self.infoStackView.alpha = 1
                self.mainView.layoutIfNeeded()
            }
        }
    }
}
