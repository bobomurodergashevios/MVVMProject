//
//  UIButtonEXT.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 19/01/23.
//

import UIKit




extension UIButton {
    func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(hex: "#00805F"), UIColor(hex: "#2AA65C")]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.locations = [0,1]
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = 12
        backgroundColor = .clear
        self.layer.insertSublayer(gradientLayer, at: 0)
      }
}
