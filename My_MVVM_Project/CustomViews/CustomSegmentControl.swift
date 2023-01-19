//
//  CustomSegmentedControl.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 26/12/22.
//

import Foundation
import UIKit
import SnapKit
public protocol CustomSegmentedControlDelegate: AnyObject {
    func changeToIndex(index: Int)
}

public class CustomSegmentedControl: UIView {
    
    private var buttons: [UIButton]!
    private var selectorView: UIView!
    private var diminsions: [CGFloat]!
    
    public private(set) var selectedIndex: Int = 0
    
    public var items: [String] = ["segment one", "segment two"] {
        didSet {
            updateViews()
        }
    }
    
    public weak var delegate: CustomSegmentedControlDelegate?
    
    public var textColor: UIColor = UIColor.black.withAlphaComponent(0.5)
    public var selectedViewColor: UIColor = .lightGreenOne
    public var selectedTextColor: UIColor = .black
    public var buttonTitleFont: UIFont = .systemFont(ofSize: 18, weight: .regular)
    public var buttonsSpacing: CGFloat = 16
    
    convenience public init(buttonTitles: [String]){
        self.init(frame: CGRect.zero, buttonTitles: buttonTitles)
    }
    
    convenience public init(frame: CGRect, buttonTitles: [String]) {
        self.init(frame: frame)
        
        self.items = buttonTitles
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        updateViews()
    }
    
    private func updateViews() {
        
        createButton()
        setupStackView()
        setupSelectorView()
    }
    
    private func setupStackView() {
        let stackView = UIStackView()
        buttons.forEach { stackView.addArrangedSubview($0) }
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = buttonsSpacing
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
//        stackView.makeConstraint { $0.centerY.leading(16).equalToSuperView() }
    }
    
    private func setupSelectorView() {
        diminsions = items.map { widthString(text: $0) + buttonsSpacing }
        let x = diminsions[0..<selectedIndex].reduce(12, +)
        
        let backSelectorView = UIView(frame: CGRect(x: 0, y: frame.height - 1, width: frame.width, height: 1))
        backSelectorView.backgroundColor = UIColor.blueGrey.withAlphaComponent(0.15)
        addSubview(backSelectorView)
        
        selectorView = UIView(frame: CGRect(x: x, y: frame.height - 2, width: diminsions[0] + 8, height: 2))
        selectorView.backgroundColor = selectedViewColor
        addSubview(selectorView)
    }
    
    private func createButton() {
        subviews.forEach { $0.removeFromSuperview() }
        buttons = items.map { (title) -> UIButton in
            let button = UIButton(type: .system)
            button.titleLabel?.font = buttonTitleFont
            button.setTitle(title, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonSelected(_:)), for: .touchUpInside)
            return button
        }
        buttons[selectedIndex].setTitleColor(selectedTextColor, for: .normal)
    }
    
    @objc private func buttonSelected(_ sender: UIButton) {
        for (index, button) in buttons.enumerated() {
            button.setTitleColor(textColor, for: .normal)
            if button == sender {
                selectedIndex = index
                delegate?.changeToIndex(index: index)
                animate(index: index)
                button.setTitleColor(selectedTextColor, for: .normal)
            }
        }
    }
    
    //    with delegate updating
    public func setIndex(index: Int) {
        guard buttons != nil && index <= buttons.count else { return }
        buttonSelected(buttons[index])
    }
    
    //    without delegate updating
    public func setIndexWithoutDelegateUpdating(index: Int) {
        guard buttons != nil && index <= buttons.count else { return }
        selectedIndex = index
        animate(index: index)
        buttons[index].setTitleColor(selectedTextColor, for: .normal)
    }
    
    private func animate(index: Int) {
        let selectedPosition = diminsions[0..<index].reduce(12, +) + (index == 0 ? 0 : 8)
        UIView.animate(withDuration: 0.3) {
            self.selectorView.frame.size.width = self.diminsions[index] + (index == 0 ? 8 : 0)
            self.selectorView.frame.origin.x = selectedPosition
        }
    }
    
    private func widthString(text: String) -> CGFloat {
        let boundingBox = text.boundingRect(
            with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: self.frame.height),
            options: NSStringDrawingOptions.usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: buttonTitleFont],
            context: nil
        )
        return boundingBox.width
    }
}
