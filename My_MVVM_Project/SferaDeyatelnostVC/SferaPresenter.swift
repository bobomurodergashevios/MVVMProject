//
//  Presenter.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 18/01/23.
//

import Foundation

import UIKit

protocol SferaDeyatelnostViewPresenterProtocol : PresentationProtocol {
    
}

class SferaDeyatelnostViewPresenter : NSObject,SferaDeyatelnostViewPresenterProtocol {
  
    var view : SferaDeyatelnostViewControllerLogic
    var interactor : SferaDeyatelnostViewInteractorLogic
    var router : SferaDeyatelnostViewRouterProtocol
    
    
    public init(view: SferaDeyatelnostViewControllerLogic!, interactor: SferaDeyatelnostViewInteractorLogic!, router: SferaDeyatelnostViewRouterProtocol!) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
   
    
    func viewDidLoad() {
        view.setupSubviews()
        view.setupTargets()
        self.view.submitBtn.addTarget(self, action: #selector(onBtnTapped), for: .touchUpInside)
//        self.view?.textfield1.delegate = self
//        self.view?.textfield2.delegate = self
//        self.view?.textfield3.delegate = self
    }
    
    
    @objc func onBtnTapped() {
//        let data = AnketaDM(compName: textView1Text ?? "", addressComp: textView2Text  ?? "", locationComp: textView3Text  ?? "", fioRucovodotil: "", numberRucovoditil: "", fioBuhgalter: "", numberBuhgalter: "", schetNumber: "", MFO: "", INN: "", bank: "")
        self.router.pushVC()
    }
    
    
    
}

//extension AnketaViewPresenter : UITextViewDelegate {
//    func textViewDidChange(_ textView: UITextView) {
//        guard let text = textView.text else {return}
//        if textView.tag == 1 {
//            textView1Text = text
//        }else  if textView.tag == 2 {
//            textView2Text = text
//        }else {
//            textView3Text = text
//        }
//
//    }
//
//
//}
