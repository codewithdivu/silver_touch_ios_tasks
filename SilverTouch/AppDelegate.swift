//
//  AppDelegate.swift
//  SilverTouch
//
//  Created by Divyesh  on 11/04/24.
//

import UIKit
import SideMenu

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUpLeftMenu()
        setUpInitialVC()
        // Override point for customization after application launch.
        return true
    }
    
    func setUpInitialVC(){
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "ViewController")as! ViewController
        let navcon = UINavigationController(rootViewController: vc)
        window?.rootViewController = navcon
        window?.makeKeyAndVisible()
    }
    
    private func setUpLeftMenu() {
        let storyboard = UIStoryboard(name:"SideMenu", bundle: nil)
        let aSideMenuViewController = storyboard.instantiateViewController(withIdentifier: "SideMenuVC")as! SideMenuVC
        
        let sideMenuViewController = SideMenuNavigationController(rootViewController: aSideMenuViewController)
        sideMenuViewController.leftSide = true
        sideMenuViewController.isNavigationBarHidden = true
        SideMenuManager.default.leftMenuNavigationController = sideMenuViewController
        SideMenuManager.default.rightMenuNavigationController = sideMenuViewController
        sideMenuViewController.pushStyle = .default
        sideMenuViewController.presentationStyle = .menuSlideIn
        sideMenuViewController.presentationStyle.backgroundColor = .black
        sideMenuViewController.settings.statusBarEndAlpha = 0
        sideMenuViewController.presentationStyle.presentingEndAlpha = 0.6
        let  SCREEN_WIDTH = UIScreen.main.bounds.size.width
        sideMenuViewController.menuWidth = SCREEN_WIDTH * 0.8
    }


}

