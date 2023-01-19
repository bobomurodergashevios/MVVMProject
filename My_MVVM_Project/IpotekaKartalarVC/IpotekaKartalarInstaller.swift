//
//  IpotekaKartalarInstaller.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import UIKit

protocol IpotekaKartalarInstaller : ViewInstaller {
    var pageControll : UIPageControl! { get set }
    var scrollVieww : UIScrollView! {get set}
    var page : PageView! {get set}
    var btn1 : UIButton! {get set}
    var btn2 : UIButton! {get set}
    var btn3 : UIButton! {get set}

    var segmentWrapperStackView : UIStackView! {get set}
    var segmentControll : UISegmentedControl! {get set}
    var segmentTableView : UITableView! {get set}
    
}
extension IpotekaKartalarInstaller {
    
    
    func initSubviews() {
        pageControll = UIPageControl()
        pageControll.numberOfPages = 3
        pageControll.backgroundColor = .clear
//        pageControll.makeShadow()
        pageControll.pageIndicatorTintColor = .gray
        pageControll.currentPageIndicatorTintColor = .blue
        
        scrollVieww = UIScrollView()
        print(self.mainView.frame.width*3)
        scrollVieww.contentSize = CGSize(width: self.mainView.frame.width*3, height: scrollVieww.frame.height)
        scrollVieww.backgroundColor = .clear
        self.scrollVieww.isPagingEnabled = true
        scrollVieww.showsHorizontalScrollIndicator = false

        btn1 = UIButton()
        btn1.setTitle("To'ldirmoq", for: .normal)
        btn1.setTitleColor(.blue, for: .normal)
        btn1.backgroundColor = .white
        btn1.layer.cornerRadius = 12
        btn1.layer.borderColor = UIColor.gray.cgColor
        btn1.layer.borderWidth = 0.2
        
        
        btn2 = UIButton()
        btn2.setTitle("To'lash", for: .normal)
        btn2.setTitleColor(.blue, for: .normal)
        btn2.backgroundColor = .white
        btn2.layer.cornerRadius = 12
        btn2.layer.borderColor = UIColor.gray.cgColor
        btn2.layer.borderWidth = 0.2
        
        btn3 = UIButton()
        btn3.setTitle("Sahifalar", for: .normal)
        btn3.setTitleColor(.blue, for: .normal)
        btn3.backgroundColor = .white
        btn3.layer.cornerRadius = 12
        btn3.layer.borderColor = UIColor.gray.cgColor
        btn3.layer.borderWidth = 0.2
        
        
       
        
        segmentControll = UISegmentedControl(items: ["Ma'lumotlar","Bayonot","Arizalar"])
        segmentControll.setLayout(selectedFont: UIFont.boldSystemFont(ofSize: 16), normalFont: .boldSystemFont(ofSize: 15))
        segmentControll.selectedSegmentIndex = 0
        
        
        segmentTableView = UITableView()
        segmentTableView.backgroundColor = .clear
        segmentTableView.isScrollEnabled = false
        
        segmentWrapperStackView = UIStackView(arrangedSubviews: [segmentControll,segmentTableView])
        segmentWrapperStackView.axis = .vertical
        
    }
    
    func embedSubviews() {
        mainView.addSubview(pageControll)
        mainView.addSubview(scrollVieww)
        mainView.addSubview(btn1)
        mainView.addSubview(btn2)
        mainView.addSubview(btn3)
        mainView.addSubview(segmentWrapperStackView)
    }
    
    func addSubviewsConstraints() {
        
        pageControll.frame = CGRect(x: 100, y: 230, width: self.mainView.frame.width-200, height: 50)
        scrollVieww.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalTo(self.mainView.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(210)
        }
        
        btn1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(pageControll.snp.bottom).offset(3)
            make.height.equalTo(40)
            make.width.equalTo(120)
        }
        btn2.snp.makeConstraints { make in
            make.left.equalTo(btn1.snp.right).offset(3)
            make.top.equalTo(pageControll.snp.bottom).offset(3)
            make.height.equalTo(40)
            make.width.equalTo(110)
        }
        
        btn3.snp.makeConstraints { make in
            make.left.equalTo(btn2.snp.right).offset(3)
            make.top.equalTo(pageControll.snp.bottom).offset(3)
            make.height.equalTo(40)
            make.width.equalTo(120)
        }
        
        
        segmentWrapperStackView.snp.makeConstraints { make in
            make.top.equalTo(btn3.snp.bottom).offset(34)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(940)
        }
        
        segmentControll.snp.makeConstraints { make in
            make.height.equalTo(50)
            
        }
        segmentTableView.snp.makeConstraints { make in
            make.height.equalTo(900)
        }
    }
    
    
}
