//
//  ViewController.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 11/01/23.
//

import UIKit

class RMTabBarController: UITabBarController {

    override func viewDidLoad() {   
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupTabs()
    }

    private func setupTabs(){
        let characterVC = RMCharacterViewController()
        let locationVC = RMLocationViewController()
        let episodesVC = RMEpisodesViewController()
        let settingVC = RMSettingsViewController()
       
//        characterVC.navigationItem.largeTitleDisplayMode = .always
//        locationVC.navigationItem.largeTitleDisplayMode = .automatic
//        episodesVC.navigationItem.largeTitleDisplayMode = .automatic
//        settingVC.navigationItem.largeTitleDisplayMode = .automatic

        let nav1 = UINavigationController(rootViewController: characterVC)
        let nav2 = UINavigationController(rootViewController: locationVC)
        let nav3 = UINavigationController(rootViewController: episodesVC)
        let nav4 = UINavigationController(rootViewController: settingVC)

        if #available(iOS 13.0, *){
            nav1.tabBarItem = UITabBarItem(title: "Character", image: UIImage(systemName: "person"), tag: 0)
            nav2.tabBarItem = UITabBarItem(title: "Location", image: UIImage(systemName: "globe"), tag: 1)
            nav3.tabBarItem = UITabBarItem(title: "Episode", image: UIImage(systemName: "tv"), tag: 2)
            nav4.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(systemName: "gear"), tag: 3)
        }
        
        for nav in [nav1,nav2,nav3,nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        if #available(iOS 13.0, *) {
            let tabBarAppearance = UITabBarAppearance()
            let tabBarItemAppearance = UITabBarItemAppearance()

            tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            tabBarItemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
            
            tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
            tabBar.standardAppearance = tabBarAppearance
            
            tabBarAppearance.backgroundColor = .white
            
            
            if #available(iOS 15.0, *) {
                tabBar.scrollEdgeAppearance = tabBarAppearance
            } else {
                // Fallback on earlier versions
            }
           
        }
        if #available(iOS 13.0, *) {
            for nav in [nav1,nav2,nav3,nav4] {
                nav.navigationBar.standardAppearance = UINavigationBarAppearance()
                nav.navigationBar.compactAppearance = UINavigationBarAppearance()
                nav.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
            }
        }
       
        setViewControllers([nav1,nav2,nav3,nav4], animated: true)
        
    }
}

