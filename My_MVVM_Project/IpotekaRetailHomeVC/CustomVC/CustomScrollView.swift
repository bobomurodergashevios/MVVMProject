////
////  CustomScrollView.swift
////  My_MVVM_Project
////
////  Created by Bobomurod Ergashev on 16/01/23.
////
//
//import UIKit
//
//class CustomScrollView: UIScrollView {
//
//    var buttonPadding:CGFloat = 10
//    var xOffset:CGFloat = 0
//    var btnArr : [UIButton] = []
//    var expandView : ExpandingViewww!
//    var button = UIButton()
//    init(frame: CGRect,btnTitleArr : [String]) {
//        super.init(frame: frame)
////        self.btnArr = btnTitleArr
//        
//        for i in 0 ..< btnTitleArr.count {
//
//            button = UIButton()
//
//            button.tag = i
//            button.setTitle(btnTitleArr[i], for: .normal)
//            button.setTitleColor(.black, for: .normal)
//            btnArr.append(button)
//            button.addTarget(self, action: #selector(btnTouch(_:)), for: .touchUpInside)
//
//            button.frame = CGRect(x: xOffset, y: CGFloat(buttonPadding), width: btnTitleArr[i].widthString(btnTitleArr[i].count), height: 30)
//            button.titleLabel?.font = .systemFont(ofSize: 15)
//            xOffset = xOffset + CGFloat(buttonPadding) + button.frame.size.width
//            self.addSubview(button)
//        }
//        
//        expandView = ExpandingViewww(title: "Kartalar")
//        expandView.layer.cornerRadius = 12
//        expandView.backgroundColor = .red
//        self.addSubview(expandView)
//        expandView.snp.makeConstraints { make in
//            make.top.equalTo(button.snp.bottom)
//            make.left.equalToSuperview().offset(5)
//            make.height.equalTo(130)
//            make.right.equalToSuperview().inset(5)
//        }
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    @objc func btnTouch(_ sender : UIButton){
//        print("tapped....")
//        
//        for i in 0 ..< btnArr.count {
//            if sender.tag == i{
//                btnArr[i].setTitleColor(.magenta, for: .normal)
//                btnArr[i].titleLabel?.font = .boldSystemFont(ofSize: 18)
//                
//            }else {
//                btnArr[i].setTitleColor(.black, for: .normal)
//                btnArr[i].titleLabel?.font = .systemFont(ofSize: 15)
//            }
//        }
//        
//    }
//    
//    
//}
//extension String {
//    func widthString(_ count : Int) -> CGFloat{
//        return CGFloat(integerLiteral: count*10)
//    }
//}
