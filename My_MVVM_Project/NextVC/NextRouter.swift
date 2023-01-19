//
//  NextVCRouter.swift
//  MyViperProject
//
//  Created by Bobomurod Ergashev on 23/12/22.
//

import Foundation
import UIKit
protocol NextVCRouterLogic {
    
}
class NextVCRouter : BaseRouter, NextVCRouterLogic {
    static func createModule() -> UIViewController{
        let vc = NextViewController()
        let interactor = NextVCInteractor()
        let router = NextVCRouter(viewController: vc)
        let presenter = NextVCPresenter(view: vc, interactor: interactor, router: router)
        vc.presenter = presenter
        return vc
    }
}
