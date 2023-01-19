//
//  IpotekaVCInstaller.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 15/01/23.
//

import UIKit
protocol IpotekaVCInstallerLogic : ViewInstaller{
    var scroolVV : UIScrollView! {get set}
    var scroolContainerStackView : UIStackView!{get set}
    var homeHeaderView : HomeHeaderV!{get set}
    var collView : UICollectionView! {get set}
    var view1 : UIView! {get set}
    var aqlliUtkazmaView : AqlliUtkazmaVV! {get set}
    var view2 : UIView! {get set}
    var reklamaView : ReklamaView! {get set}
    var mavjudView : MavjudMablagView! {get set}
//    var customSegmentControlWithScrollView : CustomScrollView! {get set}
    
    var segmentStackView : UIStackView! {get set}
    var segmentControll1 : UISegmentedControl! {get set}
    var expandableSegmentStackView : UIStackView! {get set}
    var expandView : KartalarExpandingView! {get set}
    var expandView2 : KartalarExpandingView! {get set}
    var expandView3 : KartalarExpandingView! {get set}
    var expandView4 : KartalarExpandingView! {get set}
    
    var filialAndLocationView : FilialAndLocationView! {get set}
    
    var segmentStackView2 : UIStackView! {get set}
    var segmentControll2 : UISegmentedControl! {get set}
    var segmentControlItemsStack : UIStackView! {get set}
    var segmentCollectionView : UICollectionView! {get set}
    
    var valyutaKursiExpandView : ValyutaKursiExpandView! {get set}
}
extension IpotekaVCInstallerLogic {
    
    func initSubviews() {
       
        scroolVV = UIScrollView()
        scroolVV.backgroundColor = .clear
        scroolVV.showsVerticalScrollIndicator = false
        scroolVV.keyboardDismissMode = .onDrag
        
        homeHeaderView = HomeHeaderV()
        homeHeaderView.backgroundColor = .clear
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 7
        
        collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.backgroundColor = .clear
        
        view1 = UIView()
        view1.backgroundColor = UIColor(hex: "#315EA6")
        
        
        
        
        
        aqlliUtkazmaView = AqlliUtkazmaVV()
        aqlliUtkazmaView.backgroundColor = UIColor(hex: "#315EA6")
        aqlliUtkazmaView.makeShadow()
        aqlliUtkazmaView.layer.cornerRadius = 12
        
        view2 = UIView()
        view2.backgroundColor = .white
        
        
        reklamaView = ReklamaView()
        reklamaView.layer.cornerRadius = 12
        reklamaView.backgroundColor = .white
        reklamaView.makeShadow()
        
        
        mavjudView = MavjudMablagView()
        mavjudView.backgroundColor = .white
        mavjudView.layer.cornerRadius = 12
        mavjudView.makeShadow()
        
    
        segmentControll1 = UISegmentedControl(items: ["Kartalar va hisoblar","Omonatlar","Kreditlar"])
        segmentControll1.selectedSegmentIndex = 0
        segmentControll1.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for:
                .normal)
        if #available(iOS 13.0, *) {
            segmentControll1.setLayout(selectedFont: .boldSystemFont(ofSize: 16), normalFont: .systemFont(ofSize: 16))
        }
        
        
        expandView = KartalarExpandingView(title: "Kartalar", count: 3, plusBtnTxt: "+ Kartani buyurtma qiling/ulang")
        expandView.makeShadow()
        expandView.tag = 1
        expandView.backgroundColor = .white
        expandView.alpha = 1
        expandView.isHidden = false
        expandView.layer.cornerRadius = 10
        
        expandView2 = KartalarExpandingView(title: "Hisoblar", count: 3, plusBtnTxt: "")
        expandView2.makeShadow()
        expandView2.tag = 2
        expandView2.backgroundColor = .white
        expandView2.alpha = 0
        expandView2.isHidden = true
        expandView2.layer.cornerRadius = 10
        
        expandView3 = KartalarExpandingView(title: "Omonatlar", count: 0, plusBtnTxt: "+ Omonat ochish")
        expandView3.makeShadow()
        expandView3.tag = 3
        expandView3.backgroundColor = .white
        expandView3.alpha = 0
        expandView3.isHidden = true
        expandView3.layer.cornerRadius = 10
        
        expandView4 = KartalarExpandingView(title: "Kreditlar", count: 0, plusBtnTxt: "+ Kredit rasmiylashtirish")
        expandView4.makeShadow()
        expandView4.tag = 4
        expandView4.backgroundColor = .white
        expandView4.alpha = 0
        expandView4.isHidden = true
        expandView4.layer.cornerRadius = 10
        
      
        
        
        
//        segmentControll1.addTarget(self, action: #selector(handleSegmentChange(_:)), for: .touchUpInside)
        expandableSegmentStackView = UIStackView(arrangedSubviews: [expandView,expandView2,expandView3,expandView4])
        expandableSegmentStackView.axis = .vertical
    
        
        segmentStackView = UIStackView(arrangedSubviews: [segmentControll1,expandableSegmentStackView])
        segmentStackView.axis = .vertical
        segmentStackView.backgroundColor = .clear
        
        
        filialAndLocationView = FilialAndLocationView()
        filialAndLocationView.backgroundColor = .white
        filialAndLocationView.layer.cornerRadius = 12
        filialAndLocationView.makeShadow()

        
        
        segmentControll2 = UISegmentedControl(items: ["Foydali","Namunalar","Mening uyim"])
        segmentControll2.setLayout(selectedFont: .boldSystemFont(ofSize: 18), normalFont: .systemFont(ofSize: 18))
        segmentControll1.selectedSegmentIndex = 0
        
        var layout2 = UICollectionViewFlowLayout()
        layout2.scrollDirection = .horizontal
        layout2.minimumInteritemSpacing = 10
        
        segmentCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout2)
        segmentCollectionView.backgroundColor = .clear
        
        segmentControlItemsStack = UIStackView(arrangedSubviews: [segmentCollectionView])
        segmentControlItemsStack.backgroundColor = .clear
        
        segmentStackView2 = UIStackView(arrangedSubviews: [segmentControll2,segmentControlItemsStack])
        segmentStackView2.axis = .vertical

        
        valyutaKursiExpandView = ValyutaKursiExpandView(frame: .zero, title: "Valyuta kursi")
        valyutaKursiExpandView.makeShadow()
//        valyutaKursiExpandView.tag = 4
        valyutaKursiExpandView.backgroundColor = .white
//        valyutaKursiExpandView.alpha = 0
//        valyutaKursiExpandView.isHidden = true
        valyutaKursiExpandView.layer.cornerRadius = 10
        
        
        scroolContainerStackView = UIStackView(arrangedSubviews: [view1,view2])
        scroolContainerStackView.axis = .vertical
        scroolContainerStackView.distribution = .fill
        scroolContainerStackView.alignment = .fill
        scroolContainerStackView.spacing = 5
        scroolContainerStackView.backgroundColor = .yellow
        
    }
    func embedSubviews() {
        scroolVV.addSubview(scroolContainerStackView)
        mainView.addSubview(scroolVV)
        
        view1.addSubview(homeHeaderView)
        view1.addSubview(collView)
        view2.addSubview(aqlliUtkazmaView)
        view2.addSubview(reklamaView)
        view2.addSubview(mavjudView)
        view2.addSubview(segmentStackView)
        view2.addSubview(filialAndLocationView)
        view2.addSubview(segmentStackView2)
        view2.addSubview(valyutaKursiExpandView)
        
    }
    func addSubviewsConstraints() {
        
        scroolVV.snp.makeConstraints { make in
            make.top.equalTo(self.mainView.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(mainView.safeAreaLayoutGuide.snp.bottom)
        }
        scroolContainerStackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        homeHeaderView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(80)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
        }
        
        collView.snp.makeConstraints { make in
            make.top.equalTo(homeHeaderView.snp.bottom)
            make.height.equalTo(160)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview()
        }
        view1.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(250)
        }
        view2.snp.makeConstraints { make in
            make.top.equalTo(view1.snp.bottom)
            make.height.equalTo(1800)
            make.left.right.equalToSuperview()
        }
        
        aqlliUtkazmaView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(200)
        }
        reklamaView.snp.makeConstraints { make in
            make.top.equalTo(aqlliUtkazmaView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(140)
        }
        
        mavjudView.snp.makeConstraints { make in
            make.top.equalTo(reklamaView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(140)
        }
        
//        expandableSegmentStackView.snp.makeConstraints { make in
//            make.height.equalTo(160)
//        }
        
        segmentStackView.snp.makeConstraints { make in
            make.top.equalTo(self.mavjudView.snp.bottom).offset(30)
            
            make.left.right.equalToSuperview()
            if expandView2.alpha == 0 {
                make.height.equalTo(190)
            }else{
                make.height.equalTo(290)
            }
           
        }
       
        filialAndLocationView.snp.makeConstraints { make in
            make.top.equalTo(segmentStackView.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(120)
        }
//
        segmentControll1.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        segmentControll2.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        segmentStackView2.snp.makeConstraints { make in
            make.top.equalTo(filialAndLocationView.snp.bottom).offset(80)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(160)
        }
        
        segmentControlItemsStack.snp.makeConstraints { make in
            make.height.equalTo(130)
        }
        
        valyutaKursiExpandView.snp.makeConstraints { make in
            make.top.equalTo(segmentStackView2.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.height.equalTo(130)
        }
        
    }
}
