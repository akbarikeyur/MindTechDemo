//
//  AppDelegate.swift
//  MindTechDemo
//
//  Created by Hash Technocrats on 10/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    /**
     * UIStoryboard
     *
     * Used to access main storyboard instance
     *
     * @param
     */
    //MARK:- Share Appdelegate
    func storyboard() -> UIStoryboard
    {
        return UIStoryboard(name: "Main", bundle: nil)
    }

}

