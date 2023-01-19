//
//  MaterialMultilinedView.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//



import UIKit
import SnapKit

public class MaterialMultilineOutlinedView: UIView {
    
    private let container: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.layer.cornerRadius = 12
        container.addBottomShadow()
        return container
    }()
    public let textField: UITextView = {
        let textfield = UITextView()
        textfield.backgroundColor = .clear
        textfield.layer.cornerRadius = 12
        textfield.textAlignment = .left
        textfield.font = .systemFont(ofSize: 16)
        textfield.textAlignment = .left
        textfield.contentInsetAdjustmentBehavior = .automatic
        textfield.textColor = .lightGray
        textfield.isScrollEnabled = false
        return textfield
    }()
    
    public let headerLabel: UILabel = {
        let header = UILabel()
        header.backgroundColor = .white
        header.textAlignment = .left
        header.font = .systemFont(ofSize: 14)
        header.textColor = .secondaryText
        header.alpha = 0
        header.isHidden = true
        return header
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.distribution = .fill
        stack.axis = .vertical
        stack.layer.cornerRadius = 12
        return stack
    }()
    
    public let counterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .black
        return label
    }()
    
    private var maxChar: Int = 0
    private var placeHolder: String = ""
    
    public var didChangeTextCallback: ((String?) -> Void)?
        
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        textField.delegate = self
        
        addSubview(container)
        container.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(10)
        }
        
        container.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(52)
            make.bottom.equalToSuperview()
        }
        
        stackView.addArrangedSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        stackView.addArrangedSubview(textField)
        
        container.addSubview(counterLabel)
        counterLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
    }
    
    public func setPlaceholder(name: String) {
        textField.text = name
        headerLabel.text = name
        self.placeHolder = name
    }
    
    public func setMaxChar(maxChar: Int) {
        self.maxChar = maxChar
        counterLabel.text = "0/\(maxChar)"
    }
    
    public func setTextFieldText(text: String) {
        self.updateView(string: text)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func onTextChanged(_ textField: UITextView) {
        self.checkMaxChar(text: textField.text)
        didChangeTextCallback?(textField.text)
    }
    
    private func checkMaxChar(text: String?){
        if self.maxChar > 0{
            if let text = text {
                var helperText = ""
                if text.count > maxChar{
                    textField.text?.removeLast()
                    helperText = "\(text.count - 1)/\(maxChar)"
                } else {
                    helperText = "\(text.count)/\(maxChar)"
                }
                self.counterLabel.text = helperText
            }
        }
    }
    
    private func updateView(string: String){
        self.checkMaxChar(text: string)
        if let text = textField.text {
            if text.isNotEmpty {
                textField.text = string
                textField.textColor = .primaryText
                UIView.transition(with: self.headerLabel,
                                  duration: 0.25,
                                  options: .curveEaseIn,
                                  animations: { [weak self] in
                    self?.headerLabel.isHidden = false
                    self?.headerLabel.alpha = 1
                    self?.headerLabel.backgroundColor = .clear
                }, completion: nil)
                
            } else {
                textField.text = placeHolder
                textField.textColor = UIColor.lightGray
                UIView.transition(with: self.headerLabel,
                                  duration: 0.25,
                                  options: .transitionCrossDissolve,
                                  animations: { [weak self] in
                    self?.headerLabel.isHidden = true
                    self?.headerLabel.alpha = 0
                    self?.headerLabel.backgroundColor = .clear
                }, completion: nil)
//                self.container.layer.borderWidth = 1
            }
        }
    }
}

extension MaterialMultilineOutlinedView: UITextViewDelegate {
    public func textViewDidChange(_ textView: UITextView) {
        self.onTextChanged(textView)
    }
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.primaryText
        }
//        self.container.layer.borderWidth = 2
        UIView.transition(with: self.headerLabel,
                      duration: 0.25,
                       options: .curveEaseIn,
                    animations: { [weak self] in
            self?.headerLabel.isHidden = false
            self?.headerLabel.alpha = 1
            self?.headerLabel.backgroundColor = .clear
                 }, completion: nil)

    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeHolder
            textView.textColor = UIColor.lightGray
            UIView.transition(with: self.headerLabel,
                          duration: 0.25,
                           options: .transitionCrossDissolve,
                        animations: { [weak self] in
                self?.headerLabel.isHidden = false
                self?.headerLabel.alpha = 0
                self?.headerLabel.backgroundColor = .clear
                     }, completion: nil)
        }
//        self.container.layer.borderWidth = 1
    }
}

