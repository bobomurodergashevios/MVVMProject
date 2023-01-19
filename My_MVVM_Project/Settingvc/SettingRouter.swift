//
//  SettingVCRouter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 22/12/22.
//

import Foundation
import UIKit

protocol SettingVCRouterLogic  {
    func presetnVC()
    func navigationLichniyKabinet()
}
class SettingVCRouter : BaseRouter,SettingVCRouterLogic {
    
    
    
    static func createModule() -> UIViewController{
        let vc = SettingVC()
        let interactor = SettingVCInteractor()
        let router = SettingVCRouter(viewController: vc)
        let presenter = SettingVCPresenter(view: vc, interactor: interactor, router: router)
        vc.presenter = presenter
        return vc
    }
    
    func presetnVC() {
       
        let dialog = BaseViewController()
//        dialog.modalTransitionStyle = .coverVertical
//        dialog.modalPresentationStyle = .popover
//        dialog.modalPresentationCapturesStatusBarAppearance = false
        self.navigationController?.present(dialog, animated: true)
    }
    
    func navigationLichniyKabinet() {
        self.navigationController?.pushViewController(ServicesViewRouter.createModule(), animated: true)
    }
    
    
}
