//
//  UIView+EXT.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 19/12/22.
//

import Foundation
import UIKit




public extension UIView {
//    func makeConstraint(_ action: @escaping (LayoutGuide) -> Void) {
//        translatesAutoresizingMaskIntoConstraints = false
//        action(LayoutGuide(self))
//    }

    func dropShadow(_ x: CGFloat, _ y: CGFloat, _ blur: CGFloat, _ color: UIColor?, _ alpha: Float, spread: CGFloat = 0) {
        layer.shadowColor = color?.cgColor
        layer.shadowOpacity = alpha
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowRadius = blur/2
        layer.masksToBounds = false
        let rect = bounds.insetBy(dx: -spread, dy: -spread)
        layer.shadowPath = UIBezierPath(rect: rect).cgPath
    }

    func dropShadow(_ x: CGFloat, _ y: CGFloat, _ blur: CGFloat, _ color: UIColor?, _ alpha: Float, spread: CGFloat = 0, cornerRadius: CGFloat, fillColor: UIColor = .white) {
        let shadowLayer = CAShapeLayer()
        let rect = bounds.insetBy(dx: -spread, dy: -spread)
        shadowLayer.path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = fillColor.cgColor
        shadowLayer.shadowColor = color?.cgColor
        shadowLayer.shadowOpacity = alpha
        shadowLayer.shadowOffset = CGSize(width: x, height: y)
        shadowLayer.shadowRadius = blur/2
        layer.insertSublayer(shadowLayer, at: 0)
    }

    func showShadow(_ alpha: Float = 0.3) {
        layer.shadowOpacity = alpha
    }

    func hideShadow() {
        layer.shadowOpacity = 0.0
    }

    func dropInnerShadow(color: UIColor, thickness: CGFloat, cornerRadius: CGFloat = 0.0, opacity: Float = 0.16) {
        let shadowLayer = CAShapeLayer()
        shadowLayer.frame = bounds
        shadowLayer.shadowColor = color.cgColor
        shadowLayer.shadowOffset = .zero
        shadowLayer.shadowOpacity = opacity
        shadowLayer.shadowRadius = 3.0
        shadowLayer.fillRule = CAShapeLayerFillRule.evenOdd

        let shadowPath = CGMutablePath()

        let innerRect = CGRect(x: bounds.origin.x - thickness,
                               y: bounds.origin.y - thickness,
                               width: bounds.width + thickness * 2,
                               height: bounds.height + thickness * 2)

        let shadowRect = CGRect(x: bounds.origin.x - cornerRadius,
                                y: bounds.origin.y - cornerRadius,
                                width: bounds.width + cornerRadius * 2,
                                height: bounds.height + cornerRadius * 2)

        let innerPath = UIBezierPath(roundedRect: innerRect, cornerRadius: cornerRadius)


        shadowPath.addRect(shadowRect)
        shadowPath.addPath(innerPath.cgPath)
        shadowLayer.path = shadowPath

        layer.addSublayer(shadowLayer)
        clipsToBounds = true
    }

    func makeShadow(){
        layer.shadowColor = UIColor.black.withAlphaComponent(0.05).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 12)
        layer.shadowOpacity = 1
        layer.shadowRadius = 16
        layer.position = self.center
    }

    func addBottomShadow() {
        layer.shadowColor = UIColor.black.withAlphaComponent(0.04).cgColor
        layer.shadowRadius = 2
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 4)
    }
}


extension UIView {
    func displayTooltip(_ message: String, completion: (() -> Void)? = nil) {
        let tooltipBottomPadding: CGFloat = 12
        let tooltipCornerRadius: CGFloat = 6
        let tooltipAlpha: CGFloat = 0.95
        let pointerBaseWidth: CGFloat = 14
        let pointerHeight: CGFloat = 8
        let padding = CGPoint(x: 18, y: 12)
        
        let tooltip = UIView()
        
        let tooltipLabel = UILabel()
        tooltipLabel.text = "    \(message)    "
        tooltipLabel.font = UIFont.systemFont(ofSize: 12)
        tooltipLabel.contentMode = .center
        tooltipLabel.textColor = .white
        tooltipLabel.layer.backgroundColor = UIColor(red: 44 / 255, green: 44 / 255, blue: 44 / 255, alpha: 1).cgColor
        tooltipLabel.layer.cornerRadius = tooltipCornerRadius
        
        tooltip.addSubview(tooltipLabel)
        tooltipLabel.translatesAutoresizingMaskIntoConstraints = false
        tooltipLabel.bottomAnchor.constraint(equalTo: tooltip.bottomAnchor, constant: -pointerHeight).isActive = true
        tooltipLabel.topAnchor.constraint(equalTo: tooltip.topAnchor).isActive = true
        tooltipLabel.leadingAnchor.constraint(equalTo: tooltip.leadingAnchor).isActive = true
        tooltipLabel.trailingAnchor.constraint(equalTo: tooltip.trailingAnchor).isActive = true
        
        let labelHeight = message.height(withWidth: .greatestFiniteMagnitude, font: UIFont.systemFont(ofSize: 12)) + padding.y
        let labelWidth = message.width(withHeight: .zero, font: UIFont.systemFont(ofSize: 12)) + padding.x
        
        let pointerTip = CGPoint(x: labelWidth / 2, y: labelHeight + pointerHeight)
        let pointerBaseLeft = CGPoint(x: labelWidth / 2 - pointerBaseWidth / 2, y: labelHeight)
        let pointerBaseRight = CGPoint(x: labelWidth / 2 + pointerBaseWidth / 2, y: labelHeight)
        
        let pointerPath = UIBezierPath()
        pointerPath.move(to: pointerBaseLeft)
        pointerPath.addLine(to: pointerTip)
        pointerPath.addLine(to: pointerBaseRight)
        pointerPath.close()
        
        let pointer = CAShapeLayer()
        pointer.path = pointerPath.cgPath
        pointer.fillColor = UIColor(red: 44 / 255, green: 44 / 255, blue: 44 / 255, alpha: 1).cgColor
        
        tooltip.layer.addSublayer(pointer)
        (superview ?? self).addSubview(tooltip)
        tooltip.translatesAutoresizingMaskIntoConstraints = false
        tooltip.bottomAnchor.constraint(equalTo: topAnchor, constant: -tooltipBottomPadding + pointerHeight).isActive = true
        tooltip.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        tooltip.heightAnchor.constraint(equalToConstant: labelHeight + pointerHeight).isActive = true
        tooltip.widthAnchor.constraint(equalToConstant: labelWidth).isActive = true
        
        tooltip.alpha = 0
        UIView.animate(withDuration: 0.2, animations: {
            tooltip.alpha = tooltipAlpha
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0.5, animations: {
                tooltip.alpha = 0
            }, completion: { _ in
                tooltip.removeFromSuperview()
                completion?()
            })
        })
    }
}
