
//  IpotekaVC.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 15/01/23.


import UIKit
protocol IpotekaVCLogic : IpotekaVCInstallerLogic{
    func setupTargets()
}
class IpotekaVC : UIViewController, IpotekaVCLogic {
   
  
    
    var mainView: UIView!{self.view}
    var presenter : IpotekaVCPresenterLogic?
    
    var homeHeaderView: HomeHeaderV!
    var scroolVV: UIScrollView!
    var collView: UICollectionView!
    var scroolContainerStackView: UIStackView!
    var aqlliUtkazmaView: AqlliUtkazmaVV!
    var reklamaView: ReklamaView!
    var view1: UIView!
    var view2: UIView!
    var mavjudView: MavjudMablagView!
//    var customSegmentControlWithScrollView: CustomScrollView!
    var expandableSegmentStackView: UIStackView!
    var expandView: KartalarExpandingView!
    var expandView2: KartalarExpandingView!
    
    var expandView3: KartalarExpandingView!
    
    var expandView4: KartalarExpandingView!
    
    var segmentStackView: UIStackView!
    var segmentControll1: UISegmentedControl!
    var filialAndLocationView: FilialAndLocationView!
    
    
    var isSenderExpanded = false
    
    var isValExpanded = false
    
    
    var segmentControll2: UISegmentedControl!
    var segmentControlItemsStack: UIStackView!
    var segmentStackView2: UIStackView!
    var segmentCollectionView: UICollectionView!
    var valyutaKursiExpandView: ValyutaKursiExpandView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor(hex: "#315EA6")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupTargets() {
        self.collView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell1")
        self.collView.delegate = self
        self.collView.dataSource = self
        self.aqlliUtkazmaView.txtFld1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTxtFld1Tapped)))
        self.aqlliUtkazmaView.aqlliBtn.addTarget(self, action: #selector(onAqlliBtnTapped(_:)), for: .touchUpInside)
        self.aqlliUtkazmaView.kartagaBtn.addTarget(self, action: #selector(onAqlliBtnTapped(_:)), for: .touchUpInside)
        self.aqlliUtkazmaView.telnomergaBtn.addTarget(self, action: #selector(onAqlliBtnTapped(_:)), for: .touchUpInside)
        
        
        segmentControll1.addTarget(self, action: #selector(handleSegmentChange(_:)), for: .valueChanged)
        
        expandView.moreButton.addTarget(self, action: #selector(onExpandTapped), for: .touchUpInside)
        expandView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onExpandTapped)))
        expandView2.moreButton.addTarget(self, action: #selector(onExpandTapped), for: .touchUpInside)
        expandView2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onExpandTapped)))
        expandView3.moreButton.addTarget(self, action: #selector(onExpandTapped), for: .touchUpInside)
        expandView3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onExpandTapped)))
        expandView4.moreButton.addTarget(self, action: #selector(onExpandTapped), for: .touchUpInside)
        expandView4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onExpandTapped)))
        segmentCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell2")
        segmentCollectionView.delegate = self
        segmentCollectionView.dataSource = self
        self.valyutaKursiExpandView.moreButton.addTarget(self, action: #selector(valyutaExpandViewTapped), for: .touchUpInside)
        self.reklamaView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onReklamaViewTapped)))
    }
    
    @objc func onExpandTapped(expandVV : KartalarExpandingView) {
        print("tapped....")
        self.senderExpandView(isExpand: self.isSenderExpanded,expandView: expandVV)
    }
    @objc func valyutaExpandViewTapped() {
        print("tapped....")
        self.valyutaExpandView(isExpand: self.isValExpanded)
    }
    func senderExpandView(isExpand: Bool,expandView: KartalarExpandingView){
        if isExpand {
            isSenderExpanded = false
           
            UIView.animate(withDuration: 0.3, delay: 0.0) {
            
                self.expandView.stackView.alpha = 0
                self.expandView.stackView.isHidden = true
                self.segmentStackView.snp.updateConstraints { make in
                    make.height.equalTo(160)
                }
                self.mainView.layoutIfNeeded()
            }
        } else {
            isSenderExpanded = true
            
            UIView.animate(withDuration: 0.3, delay: 0.1) {
                self.expandView.stackView.alpha = 1
                self.expandView.stackView.isHidden = false
                
                self.segmentStackView.snp.updateConstraints { make in
                    make.height.equalTo(280)
                }
                self.mainView.layoutIfNeeded()
            }
        }
    }
    
    func valyutaExpandView(isExpand: Bool){
        if isExpand {
            isValExpanded = false
           
            UIView.animate(withDuration: 0.3, delay: 0.0) {
            
                self.valyutaKursiExpandView.stackView.alpha = 0
                self.valyutaKursiExpandView.stackView.isHidden = true
                self.valyutaKursiExpandView.snp.updateConstraints { make in
                    make.height.equalTo(130)
                }
                self.mainView.layoutIfNeeded()
            }
        } else {
            isValExpanded = true
            
            UIView.animate(withDuration: 0.3, delay: 0.1) {
                self.valyutaKursiExpandView.stackView.alpha = 1
                self.valyutaKursiExpandView.stackView.isHidden = false
                self.valyutaKursiExpandView.snp.updateConstraints { make in
                    make.height.equalTo(250)
                }
                self.mainView.layoutIfNeeded()
            }
        }
    }
    
    @objc func handleSegmentChange(_ segmentedControl : UISegmentedControl) {
        print("tap segment item ...")
        print(segmentedControl.selectedSegmentIndex)

        if segmentedControl.selectedSegmentIndex == 0 {
            expandView.alpha = 1
            expandView.isHidden = false
            expandView2.alpha = 0
            expandView2.isHidden = true
            
            expandView3.alpha = 0
            expandView3.isHidden = true
            expandView4.alpha = 0
            expandView4.isHidden = true
            
            
        } else if segmentedControl.selectedSegmentIndex == 1 {
            expandView2.alpha = 1
            expandView2.isHidden = false
            
            expandView.alpha = 0
            expandView.isHidden = true
            expandView3.alpha = 0
            expandView3.isHidden = true
            expandView4.alpha = 0
            expandView4.isHidden = true
            
        }else if segmentedControl.selectedSegmentIndex == 2 {
            expandView3.alpha = 1
            expandView3.isHidden = false

            expandView2.alpha = 0
            expandView2.isHidden = true
            expandView.alpha = 0
            expandView.isHidden = true
            expandView4.alpha = 0
            expandView4.isHidden = true
        }
    }
    @objc func onAqlliBtnTapped(_ sender : UIButton) {
        self.checked(sender)
    }
    
    @objc func onTxtFld1Tapped(){
        let dialog = BaseViewController()
        self.present(dialog, animated: true)
    }
    @objc func onReklamaViewTapped(){
        presenter?.navToKartalarVC()
    }
}

extension IpotekaVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numofsection : Int!
        if collectionView == self.collView {
            numofsection = 6
        }else if collectionView == self.segmentCollectionView{
            numofsection = 5
        }
        return numofsection
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell : UICollectionViewCell!
        if collectionView == self.collView {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath)
            let rand = CGFloat.random(in: 0...1)
            cell.contentView.backgroundColor = UIColor(red: rand, green: rand, blue: rand, alpha: 1.0)
        }else if collectionView == segmentCollectionView {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath)
            let rand = CGFloat.random(in: 0...1)
            cell.contentView.backgroundColor = UIColor(red: rand, green: rand, blue: rand, alpha: 1.0)
            cell.contentView.layer.cornerRadius = 10
            
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 130)
    }
    func checked(_ sender : UIButton) {
        if sender.tag == 1 {
            self.aqlliUtkazmaView.aqlliBtn.backgroundColor = .white
            self.aqlliUtkazmaView.kartagaBtn.backgroundColor = .clear
            self.aqlliUtkazmaView.telnomergaBtn.backgroundColor = .clear

            self.aqlliUtkazmaView.txtFld1.isHidden = false
            self.aqlliUtkazmaView.txtFld1.alpha = 1
            self.aqlliUtkazmaView.txtFld2.isHidden = false
            self.aqlliUtkazmaView.txtFld2.alpha = 1
            
            self.aqlliUtkazmaView.txtFld3.isHidden = true
            self.aqlliUtkazmaView.txtFld3.alpha = 0
            self.aqlliUtkazmaView.txtFld4.isHidden = true
            self.aqlliUtkazmaView.txtFld4.alpha = 0
            self.aqlliUtkazmaView.txtFld5.isHidden = true
            self.aqlliUtkazmaView.txtFld5.alpha = 0
            self.aqlliUtkazmaView.txtFld6.isHidden = true
            self.aqlliUtkazmaView.txtFld6.alpha = 0
        } else if sender.tag == 2 {
            self.aqlliUtkazmaView.aqlliBtn.backgroundColor = .clear
            self.aqlliUtkazmaView.kartagaBtn.backgroundColor = .white
            self.aqlliUtkazmaView.telnomergaBtn.backgroundColor = .clear
            
            self.aqlliUtkazmaView.txtFld3.isHidden = false
            self.aqlliUtkazmaView.txtFld3.alpha = 1
            self.aqlliUtkazmaView.txtFld4.isHidden = false
            self.aqlliUtkazmaView.txtFld4.alpha = 1
            
            self.aqlliUtkazmaView.txtFld1.isHidden = true
            self.aqlliUtkazmaView.txtFld1.alpha = 0
            self.aqlliUtkazmaView.txtFld2.isHidden = true
            self.aqlliUtkazmaView.txtFld2.alpha = 0
            self.aqlliUtkazmaView.txtFld5.isHidden = true
            self.aqlliUtkazmaView.txtFld5.alpha = 0
            self.aqlliUtkazmaView.txtFld6.isHidden = true
            self.aqlliUtkazmaView.txtFld6.alpha = 0
        }else if sender.tag == 3 {
            self.aqlliUtkazmaView.aqlliBtn.backgroundColor = .clear
            self.aqlliUtkazmaView.kartagaBtn.backgroundColor = .clear
            self.aqlliUtkazmaView.telnomergaBtn.backgroundColor = .white
            
            self.aqlliUtkazmaView.txtFld5.isHidden = false
            self.aqlliUtkazmaView.txtFld5.alpha = 1
            self.aqlliUtkazmaView.txtFld6.isHidden = false
            self.aqlliUtkazmaView.txtFld6.alpha = 1
            
            self.aqlliUtkazmaView.txtFld2.isHidden = true
            self.aqlliUtkazmaView.txtFld2.alpha = 0
            self.aqlliUtkazmaView.txtFld1.isHidden = true
            self.aqlliUtkazmaView.txtFld1.alpha = 0
            self.aqlliUtkazmaView.txtFld4.isHidden = true
            self.aqlliUtkazmaView.txtFld4.alpha = 0
            self.aqlliUtkazmaView.txtFld3.isHidden = true
            self.aqlliUtkazmaView.txtFld3.alpha = 0
            self.aqlliUtkazmaView.txtFld4.isHidden = true
            self.aqlliUtkazmaView.txtFld4.alpha = 0
        }
    }
    
}
