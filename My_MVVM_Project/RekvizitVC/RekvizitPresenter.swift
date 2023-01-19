//
//  RekvizitViewPresenter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 21/12/22.
//

import Foundation
import UIKit

protocol RekvizitViewPresenterLogic : PresentationProtocol {
    
}
class RekvizitViewPresenter: NSObject, RekvizitViewPresenterLogic {
    var view : RekvizitViewControllerLogic
    var interactor : RekvizitViewInteractorLogic
    var router : RekvizitViewRouterLogic
    
    init(view: RekvizitViewControllerLogic, interactor: RekvizitViewInteractorLogic, router: RekvizitViewRouterLogic) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    var textView1Text : String!
    var textView2Text : String!
    var textView3Text : String!
    var textView4Text : String!
    
    var data: AnketaDM?

    func viewDidLoad() {
        view.setupTargets()
        view.setupSubviews()
        self.view.submitBtn.addTarget(self, action: #selector(onBtnTapped(_:)), for: .touchUpInside)
//        self.view.textfield2.dropDownImage.addTarget(self, action: #selector(ontap(_:)), for: .touchUpInside)
        
    }
    
    @objc func ontap(_ send : UIButton){
//        
        print("fs")
    }
    @objc func onBtnTapped(_ sender : UIButton) {
//        guard let data = data else { return }
//        let request = AnketaDM(compName: data.compName  , addressComp: data.addressComp  , locationComp: data.locationComp  , fioRucovodotil: textView1Text  ?? "", numberRucovoditil: textView2Text  ?? "", fioBuhgalter: textView3Text  ?? "", numberBuhgalter: textView4Text  ?? "", schetNumber: "", MFO: "", INN: "", bank: "")
        self.router.pushVC()
    }
}

//extension ZayavkaViewPresenter : UITextViewDelegate {
//    func textViewDidChange(_ textView: UITextView) {
//        guard let text = textView.text else {return}
//        switch textView.tag {
//            case 1 : textView1Text = text
//            case 2 : textView2Text = text
//            case 3 : textView3Text = text
//            case 4 : textView4Text = text
//        default: break
//        }
//    }
//}

//extension RekvizitViewPresenter : UITextFieldDelegate{
////    func textFieldDidEndEditing(_ textField: UITextField) {
////        let text = textField.text ?? ""
////        print(text)
////    }
//}
