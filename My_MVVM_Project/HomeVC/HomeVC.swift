//
//  HomeViewController.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 12/01/23.
//

import UIKit
protocol HomeViewControllerLogic : HomeInstaller {
    func setupTargets()
}
class HomeViewController: UIViewController,HomeViewControllerLogic {
  
    
    var expandView: ExpandingViewww!
    var baseView: UIView!
    var fikrView: UIView!
    var fikrLbl: UILabel!
    
    var mainView: UIView!{self.view}
    var presenter : HomePresenterLogic?
    
    
    var isSenderExpanded = false
    var isReceiverExpanded = false
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#F7F7F7")
        title = "Kapital Agent"
        
        self.navigationController?.navigationBar.backgroundColor = .white
//        self.navigationController?.navigationBar.prefersLargeTitles = true
        if #available(iOS 13.0, *) {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil)
        }
        if #available(iOS 13.0, *) {
            self.navigationController?.navigationBar.standardAppearance = UINavigationBarAppearance()
            self.navigationController?.navigationBar.compactAppearance = UINavigationBarAppearance()
            self.navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
        }
        
    }
    

    
    func setupTargets() {
        expandView.moreButton.addTarget(self, action: #selector(onExpandTapped), for: .touchUpInside)
        expandView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onExpandTapped)))
        expandView.anketaContainer.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onAnketaLblTapped)))
    }
    @objc func onAnketaLblTapped(){
        print("sffsf")
        presenter?.navToVC()
    }
    @objc func onExpandTapped() {
        print("tapped....")
        self.senderExpandView(isExpand: self.isSenderExpanded)
    }
    
    func senderExpandView(isExpand: Bool){
        if isExpand {
            isSenderExpanded = false
           
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .transitionCrossDissolve) {
                self.expandView.stackView.alpha = 0
                self.expandView.stackView.isHidden = true
                self.expandView.snp.updateConstraints { make in
                    make.height.equalTo(120)
                }
                self.mainView.layoutIfNeeded()
            }
        } else {
            isSenderExpanded = true
            
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .transitionCrossDissolve) {
                self.expandView.stackView.alpha = 1
                self.expandView.stackView.isHidden = false
                self.expandView.snp.updateConstraints({ make in
                       make.height.equalTo(200)
                })
                self.mainView.layoutIfNeeded()
            }
        }
    }
}
