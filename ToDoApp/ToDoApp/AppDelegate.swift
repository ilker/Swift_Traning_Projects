//
//  AppDelegate.swift
//  ToDoApp
//
//  Created by ILKER on 16.11.2023.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        window = UIWindow()
        window?.rootViewController = MainTabBarViewController()
        window?.makeKeyAndVisible()
        return true
    }




}

