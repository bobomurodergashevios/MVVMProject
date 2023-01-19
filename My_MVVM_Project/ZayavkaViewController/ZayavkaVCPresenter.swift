//
//  ZayavkaViewPresenter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 19/12/22.
//

import UIKit
//internal var data : AnketaDM = AnketaDM(compName: "", addressComp: "", locationComp: "", fioRucovodotil: "", numberRucovoditil: "", fioBuhgalter: "", numberBuhgalter: "", schetNumber: "", MFO: "", INN: "", bank: "")
protocol ZayavkaPresentationLogic : PresentationProtocol {
    
}
class ZayavkaViewPresenter: NSObject, ZayavkaPresentationLogic {
    var view : ZayavkaViewControllerLogic
    var interactor : ZayavkaViewInteractorLogic
    var router : ZayavkaRouterLogic
    
    init(view: ZayavkaViewControllerLogic, interactor: ZayavkaViewInteractorLogic, router: ZayavkaRouterLogic) {
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
//        self.view.textfield1.delegate = self
//        self.view.textfield2.delegate = self
//        self.view.textfield3.delegate = self
//        self.view.textfield4.delegate = self
        self.view.submitBtn.addTarget(self, action: #selector(onBtnTapped(_:)), for: .touchUpInside)
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
