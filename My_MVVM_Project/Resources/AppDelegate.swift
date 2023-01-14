//
//  AppDelegate.swift
//  My_MVVM_Project
//
//  Created by Bobomurod Ergashev on 11/01/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        UINavigationBar.appearance().barStyle = .blackTranslucent
//        UINavigationBar.appearance().tintColor = .white

        window?.rootViewController = UINavigationController(rootViewController: HomeRouter.createModule())
        return true
    }

   


}

