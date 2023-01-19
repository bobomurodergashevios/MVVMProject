//
//  UICOLOR+EXT.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 17/12/22.
//

import Foundation
import UIKit







public extension UIColor {
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        if #available(iOS 13, *) {
            guard let int = Scanner(string: hex).scanInt32(representation: .hexadecimal) else {
                self.init(red: 0, green: 0, blue: 0, alpha: 1)
                return
            }
            let a, r, g, b: Int32
            switch hex.count {
            case 3:  (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17) // (12-bit)
            case 6:  (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)                   // RGB (24-bit)
            case 8:  (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)      // ARGB (32-bit)
            default: (a, r, g, b) = (255, 0, 0, 0)
            }
            self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a) / 255.0)
        } else {
            var int = UInt32()
            
            Scanner(string: hex).scanHexInt32(&int)
            let a, r, g, b: UInt32
            switch hex.count {
            case 3:  (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17) // RGB (12-bit)
            case 6:  (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)                   // RGB (24-bit)
            case 8:  (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)      // ARGB (32-bit)
            default: (a, r, g, b) = (255, 0, 0, 0)
            }
            
            self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(a) / 255.0)
        }
    }
    
    var toHexString: String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return NSString(format:"#%06x", rgb) as String
    }
    
    static func makeGradientColor(_ b: UIColor,_ e: UIColor, _ style: GradientStyles = .leftToRight) -> CAGradientLayer{
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [b.cgColor, e.cgColor]
        gradientLayer.shouldRasterize = true
        switch style {
            case .leftToRight :
                gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
                gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
                break
                
            case .topToBottom :
                gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
                gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
                break
                
            case .leftTopToBottomRight :
                gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
                gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
                break
                
            case .leftBottomToTopRight :
                gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
                gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
                break
        }
        
        return gradientLayer
    }
}

public enum GradientStyles : Int {
    case topToBottom = 100
    case leftToRight
    case leftTopToBottomRight
    case leftBottomToTopRight
}

@nonobjc public extension UIColor {
    
    
    /// Day/Text/Brand  hex: #2AA65C
    static var lightGreenOne: UIColor { UIColor(hex: "#2AA65C") }
    
    /// hex: #829199
    static var tertiaryGray: UIColor { UIColor(hex: "#829199") }
    
    /// hex: #E9EFF0
    static var backgroundGray: UIColor { .init(hex: "#E9EFF0") }
    
    /// hex: #11BB91
    static var brandPrimaryGreen: UIColor { UIColor(hex: "#11BB91") }
    
    class var blueGrey: UIColor {
        return UIColor(red: 132.0 / 255.0, green: 142.0 / 255.0, blue: 159.0 / 255.0, alpha: 1.0)
    }
    
///    hex: #E9EFF0
    static var singButtonColor: UIColor { UIColor(red: 0.914, green: 0.937, blue: 0.941, alpha: 1) }
 
    
    //MARK: - New color set
    
    static var secondaryGray: UIColor { UIColor(hex: "#505C64") }
    
    static var primaryGreen: UIColor { UIColor(hex: "#008C62") }
    
    static var secondaryGreen: UIColor { UIColor(hex: "#2AA65C") }
    
    static var primaryText: UIColor { UIColor(hex: "#071222") }
    static var shadowcolor : UIColor {UIColor(hex: "#F8F3F9")}
    static var secondaryText: UIColor {  UIColor(hex: "#566681") }
    
    static var redColor: UIColor { UIColor(hex: "#FF0000") }
    
    static var graySeparatorColor: UIColor { UIColor(hex: "#D9D9D9") }
    
    static var secondaryDay: UIColor { UIColor(hex: "#F1F2F6") }
    
    static var yellowColor: UIColor { UIColor(hex: "#F4B000") }
    
    static var borderLight: UIColor { UIColor(hex: "#F0F1F6") }
    
    static var orangeColor: UIColor { UIColor(hex: "#FCB016") }
}
