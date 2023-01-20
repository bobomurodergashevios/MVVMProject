//
//  MainTabBarViewController.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 19/01/23.
//

import Foundation
import UIKit
protocol MainTabBarVCLogic{
    
}


class MainTabbarController: UITabBarController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        self.view.backgroundColor = UIColor(hex: "#F7F7F7")
        
            self.tabBar.tintColor = UIColor.white // tab bar icon tint color
            self.tabBar.isTranslucent = false
            UITabBar.appearance().barTintColor = UIColor.blue // tab bar b


       
        viewControllers = [
            generateNavigationControllers(rootViewController: IpotekaVCRouter.createModule(), title: "home", image: UIImage(named: "home")),
            generateNavigationControllers(rootViewController: IpotekaKartalarRouter.createModule(), title: "about", image: UIImage(named: "2")),
            generateNavigationControllers(rootViewController: RekvizitViewRouter.createModule(), title: "platoje", image: UIImage(named: "3")),
            generateNavigationControllers(rootViewController: AnketaRouter.createModule(), title: "menu", image: UIImage(named: "5"))
        ]
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    

    fileprivate func generateNavigationControllers(rootViewController : UIViewController, title: String, image: UIImage?) -> UIViewController {
        let nav = rootViewController
        nav.title = title
        nav.tabBarItem.image = image
        
        rootViewController.navigationItem.title = title
//        nav.navigationBar.prefersLargeTitles = true
        if #available(iOS 13.0, *) {
            let tabBarAppearance = UITabBarAppearance()
            let tabBarItemAppearance = UITabBarItemAppearance()
            tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            tabBarItemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
            
            tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
            tabBar.standardAppearance = tabBarAppearance
            if #available(iOS 15.0, *) {
                tabBar.scrollEdgeAppearance = tabBarAppearance
            } else {
                // Fallback on earlier versions
            }
        } else {
            // Fallback on earlier versions
        }
      
        

        
        
       
        
//        if #available(iOS 13.0, *) {
//            nav.navigationBar.standardAppearance = UINavigationBarAppearance()
//            nav.navigationBar.compactAppearance = UINavigationBarAppearance()
//            nav.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
//        }
        return nav
    }


}
