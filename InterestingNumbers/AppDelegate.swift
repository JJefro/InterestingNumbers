//
//  AppDelegate.swift
//  InterestingNumbers
//
//  Created by Jevgenijs Jefrosinins on 03/07/2022.
//
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let mainFlow = MainFlow(window: window)
        mainFlow.launch()
        return true
    }
}
