//
//  FloatingTextFieldView.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 21/12/22.
//

import Foundation

import UIKit
import SnapKit

public class FloatingTextFieldView: UIView {
    
    private let container: UIView = {
        let container = UIView()
        container.backgroundColor = UIColor(hex: "#FFFFFF")
        container.layer.cornerRadius = 12
        container.addBottomShadow()
        return container
    }()
    public let textField: UITextField = {
        let textfield = UITextField()
        textfield.backgroundColor = .clear
        textfield.layer.cornerRadius = 12
        textfield.textAlignment = .left
        textfield.textColor = .lightGray
        textfield.font = .boldSystemFont(ofSize: 16)
        return textfield
    }()
    
    public let headerLabel: UILabel = {
        let header = UILabel()
        header.backgroundColor = .white
        header.textAlignment = .left
        header.font = .boldSystemFont(ofSize: 14)
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
    
    public let leadingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black.withAlphaComponent(0.7)
        return label
    }()
    
    public var dropDownImage: UIButton = {
        let image = UIButton()
//        image.contentMode = .scaleAspectFit
        return image
    }()
    
    public let valyutaView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    public let valImg : UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFit
        imgview.clipsToBounds = true
        imgview.layer.masksToBounds = true
        imgview.layer.cornerRadius = 12.5
        return imgview
    }()
    public let valBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 15)
        return btn
    }()
    
    private var maxChar: Int = 0
    private var placeHolder: String = ""
    var previousValue = ""
    public var type: TextFieldType = .simple
    public var isSecured : Bool?
    var txtFld2IsSecure = false

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
        
        textField.sizeToFit()
        stackView.addSubview(textField)
        
        
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        container.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(6)
            make.trailing.equalToSuperview().inset(6)
            make.height.equalTo(20)
        }
        stackView.addArrangedSubview(leadingLabel)
        stackView.addArrangedSubview(counterLabel)
        
        container.addSubview(valyutaView)
        valyutaView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(12)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        valyutaView.addSubview(valImg)
        valImg.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.width.height.equalTo(25)
            make.centerY.equalToSuperview()
        }
        valyutaView.addSubview(valBtn)
        valBtn.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(valImg.snp.right).offset(-17)
            make.right.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        container.addSubview(dropDownImage)
        dropDownImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(12)
            make.width.height.equalTo(20)
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
    
    public func setLeadingHelper(text: String) {
        self.leadingLabel.text = text
    }
    
    public func setLeadingAttributed(text: NSAttributedString?) {
        self.leadingLabel.attributedText = text
    }
    
    public func setTextFieldText(text: String) {
        self.updateView(string: text)
    }
//    public func isSecureTxtEntry (_ isSecure : Bool) {
//        if isSecure == true {
//            self.headerLabel.isHidden = isSecure
//            self.textField.isSecureTextEntry = isSecure
////            self.textField.text = placeHolder
//        }else{
//            self.headerLabel.isHidden = isSecure
//            self.textField.isSecureTextEntry = isSecure
//        }
//
//    }
    public func showValyutaOption(){
        var image = UIImage(named: "USD_F")
        valImg.image = image
        valBtn.setTitle("USD", for: .normal)
    }
    public func showDropDownIcon() {
        var image: UIImage
        if #available(iOS 13.0, *) {
            if self.type == .password {
                image = UIImage(named: "lockkk")!
            }else {
                image = UIImage(systemName: "chevron.down")!
                image.withTintColor(.gray)
            }
         
        } else {
            image = UIImage()
        }
        
        dropDownImage.setImage(image, for: .normal)
        if type == .password {
            dropDownImage.addTarget(self, action: #selector(ontap), for: .touchUpInside)
        }
       
    }
    
    
    @objc func ontap(){
        print("aloooo")
        if txtFld2IsSecure {
            self.textField.isSecureTextEntry = self.txtFld2IsSecure
            if textField.text == placeHolder  {
                
            }else{
                self.dropDownImage.setImage(UIImage(named: "lockkk"), for: .normal)
                txtFld2IsSecure = false

            }
            
        }else{
            self.textField.isSecureTextEntry = self.txtFld2IsSecure
            if textField.text == placeHolder {
                
            }else {
                self.dropDownImage.setImage(UIImage(named: "unlockeddd"), for: .normal)
                txtFld2IsSecure = true

            }
        }
            
            
    }
    
    public func hideDropDownIcon() {
        let image = UIImage()
        dropDownImage.setImage(image, for: .normal)
        dropDownImage.isHidden = true
        
        stackView.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
    //    public func setValyutaOption(){
    //
    //    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func onTextChanged(_ textField: UITextField) {
        if self.type == .amount {
            guard var mineText = textField.text?.replacingOccurrences(of: ",", with: ".").replacingOccurrences(of: " ", with: "") else { return }
            var arrays = mineText.components(separatedBy: ".")
            let halfText = arrays[0]
            var reversedHalfText = String(halfText.reversed())
            reversedHalfText.insertedSeparator(" ", atEvery: 3)
            arrays[0] = String(reversedHalfText.reversed())
            mineText = arrays.joined(separator: ".")
            self.textField.text = mineText
            
            if mineText.filter({ (character) -> Bool in
                return character == "."
            }).count < 4 {
                let array = mineText.components(separatedBy: ".")
                if array.count == 2 {
                    if array[1].count > 4 {
                        self.textField.text = previousValue
                    }
                }
            } else {
                self.textField.text = previousValue
            }
            
            previousValue = self.textField.text ?? ""
            didChangeTextCallback?(textField.text)
        } else if type == .password {
                self.textField.isSecureTextEntry = isSecured ?? false

                didChangeTextCallback?(textField.text)

        }else{
            didChangeTextCallback?(textField.text)

        }
        
        self.checkMaxChar(text: textField.text)
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
        if let text = textField.text {
            if !text.isEmpty {
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
                textField.textColor = UIColor.white
                UIView.transition(with: self.headerLabel,
                                  duration: 0.25,
                                  options: .transitionCrossDissolve,
                                  animations: { [weak self] in
                    self?.headerLabel.alpha = 0
                    self?.headerLabel.isHidden = true
                    self?.headerLabel.backgroundColor = .clear
                }, completion: nil)
            }
        }
        self.checkMaxChar(text: string)
    }
}

extension FloatingTextFieldView: UITextFieldDelegate {
    
    public func textFieldDidChangeSelection(_ textField: UITextField) {
        self.onTextChanged(textField)
    }
    
    //    public func textViewDidChange(_ textView: UITextView) {
    //        self.onTextChanged(textView)
    //    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.textColor == UIColor.lightGray {
            textField.text = nil
            textField.textColor = UIColor.primaryText
        }
        UIView.transition(with: self.headerLabel,
                          duration: 0.25,
                          options: .transitionCrossDissolve,
                          animations: { [weak self] in
            self?.headerLabel.alpha = 1
            self?.headerLabel.isHidden = false
            self?.headerLabel.backgroundColor = .clear
        }, completion: nil)
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text {
            if text.isEmpty {
                textField.text = placeHolder
                textField.isSecureTextEntry = false
                textField.textColor = UIColor.lightGray
                UIView.transition(with: self.headerLabel,
                                  duration: 0.25,
                                  options: .transitionCrossDissolve,
                                  animations: { [weak self] in
                    self?.headerLabel.alpha = 0
                    self?.headerLabel.isHidden = true
                    self?.headerLabel.backgroundColor = .clear
                }, completion: nil)
            }else{
            }
        }
    }
}

public enum TextFieldType {
    case amount
    case simple
    case password
}
