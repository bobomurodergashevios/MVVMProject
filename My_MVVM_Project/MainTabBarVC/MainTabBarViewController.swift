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







//
//import UIKit
//
//protocol MyTabControllerProtocol: AnyObject {
//    func tabLongPressed()
//}
//
//
//class MainTabController: UITabBarController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        viewControllers = [
//            generateVC(viewController: IpotekaVCRouter.createModule(), title: "Tasks", image: UIImage(named: "arrow_right")!, selectedImage: UIImage(named: "atmLocation")!),
//            generateVC(viewController: IpotekaVCRouter.createModule(), title: "Profile", image: UIImage(named: "arrow_right")!, selectedImage: UIImage(named: "atmLocation")!),
//            generateVC(viewController: UIViewController(), title: "Search", image: UIImage(named: "arrow_right")!, selectedImage: UIImage(named: "atmLocation")!)
//        ]
//        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(astroButtonItemLongPressed(_:)))
//        tabBar.addGestureRecognizer(longPressRecognizer)
//        setTabBarAppearance()
//    }
//
//    private func generateVC(viewController: UIViewController, title: String, image: UIImage, selectedImage: UIImage) -> UIViewController {
//        viewController.tabBarItem.title = title
//        viewController.tabBarItem.image = image
//        viewController.tabBarItem.selectedImage = selectedImage
//        return UINavigationController(rootViewController: viewController)
//    }
//
//    private func setTabBarAppearance(){
//        view.backgroundColor = .AppColors.xF5FBFF
//        tabBar.backgroundColor = .AppColors.xF5FBFF
//        tabBar.unselectedItemTintColor = .systemGray
//        tabBar.tintColor = .AppColors.x2FD1C5
//        let positionX: CGFloat = 10
//        let positionY: CGFloat = 14
//        let width = tabBar.bounds.width - positionX * 2
//        let height = tabBar.bounds.height + positionY * 2
//        let roundLayer = CAShapeLayer()
//
//        let bezierPath = UIBezierPath(roundedRect: CGRect(
//                                      x: positionX,
//                                      y: tabBar.bounds.minY-positionY,
//                                      width: width,
//                                      height: height),
//                                      cornerRadius: height/2)
//        roundLayer.path = bezierPath.cgPath
//        roundLayer.fillColor = UIColor.white.cgColor
//        roundLayer.strokeEnd = 1
//        roundLayer.strokeStart = 0
//        roundLayer.strokeColor = UIColor.AppColors.x2FD1C5.cgColor
//        tabBar.layer.insertSublayer(roundLayer, at: 0)
//        tabBar.itemWidth = width / 5
//        tabBar.itemPositioning = .centered
//    }
//
//
//    @objc func astroButtonItemLongPressed(_ recognizer: UILongPressGestureRecognizer) {
//        guard recognizer.state == .began else { return }
//        guard let tabBar = recognizer.view as? UITabBar else { return }
//        guard let tabBarItems = tabBar.items else { return }
//        guard let viewControllers = viewControllers else { return }
//        guard tabBarItems.count == viewControllers.count else { return }
//
//        let loc = recognizer.location(in: tabBar)
//
//        for (index, item) in tabBarItems.enumerated() {
//            guard let view = item.value(forKey: "view") as? UIView else { continue }
//            guard view.frame.contains(loc) else { continue }
//
//            if let nc = viewControllers[index] as? UINavigationController {
//                if let vc = nc.viewControllers.first as? MyTabControllerProtocol {
//                    vc.tabLongPressed()
//                }
//            } else if let vc = viewControllers[index] as? MyTabControllerProtocol {
//                vc.tabLongPressed()
//            }
//
//            break
//        }
//    }
//
//}
//
//
//
//
//
//extension UIColor {
//    struct AppColors {
//        static let x37313C = UIColor(hex: "37313C")
//        static let x26BFBF = UIColor(hex: "26BFBF")
//        static let xD8DEF3 = UIColor(hex: "D8DEF3")
//        static let x242736 = UIColor(hex: "242736")
//        static let xFDD563 = UIColor(hex: "FDD563")
//        static let x8BE38B = UIColor(hex: "8BE38B")
//        static let xB3B4F7 = UIColor(hex: "B3B4F7")
//        static let xC4D7FF = UIColor(hex: "C4D7FF")
//        static let xE48FFF = UIColor(hex: "E48FFF")
//        static let xF5FBFF = UIColor(hex: "F5FBFF")
//        static let x2FD1C5 = UIColor(hex: "2FD1C5")
//        static let x00394C = UIColor(hex: "00394C")
//        static let x585A66 = UIColor(hex: "585A66")
//        static let xE4EDFF = UIColor(hex: "E4EDFF")
//        static let x2F394B = UIColor(hex: "2F394B")
//        static let x9A9A9A = UIColor(hex: "9A9A9A")
//    }
//}
