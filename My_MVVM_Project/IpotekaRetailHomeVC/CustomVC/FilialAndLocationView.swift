//
//  FilialAndLocationView.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 17/01/23.
//

import UIKit

class FilialAndLocationView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        let lbl = UILabel(frame: CGRect(x: 16, y: 70, width: 250, height: self.frame.height-20))
        lbl.text = "Filiallar va bankomatlar"
        lbl.textColor = .blue
        lbl.font = .boldSystemFont(ofSize: 20)
        self.addSubview(lbl)
        
        
        let btn = UIButton(frame: CGRect(x: lbl.frame.maxX+40, y: 40, width: 40, height: 40))
        btn.setImage(UIImage(named: "right"), for: .normal)
        btn.backgroundColor = .clear
        self.addSubview(btn)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



extension UISegmentedControl {

    func setLayout(selectedFont : UIFont,normalFont : UIFont) {
        if #available(iOS 13, *) {
            let background = UIImage(color: .clear, size: CGSize(width: 2, height: 30))
            let divider = UIImage(color: .clear, size: CGSize(width: 2, height: 30))
            self.setBackgroundImage(background, for: .normal, barMetrics: .default)
            self.setBackgroundImage(divider, for: .selected, barMetrics: .default)
            self.setDividerImage(divider, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
            self.layer.borderWidth = 2
            self.layer.borderColor = UIColor.clear.cgColor
            
            self.setTitleTextAttributes([.foregroundColor: UIColor.black,.font: normalFont], for: .normal)
            self.setTitleTextAttributes([.foregroundColor: UIColor.magenta,.font : selectedFont], for: .selected)

    } else {
//        self.tintColor = tintColor
        }
    }
}

extension UIImage {

    convenience init(color: UIColor, size: CGSize) {

        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        color.set()
        
        let context = UIGraphicsGetCurrentContext()!
        context.fill(CGRect(origin: .zero, size: size))
        
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.init(data: image.pngData()!)!
    }
}

