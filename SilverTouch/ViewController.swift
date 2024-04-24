//
//  ViewController.swift
//  SilverTouch
//
//  Created by Divyesh  on 11/04/24.
//

import UIKit
import SideMenu

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func sidebarTapped(_ sender: Any) {
        if let menuLeftNavigationController = SideMenuManager.default.leftMenuNavigationController {
            if menuLeftNavigationController.presentingViewController != nil {
                menuLeftNavigationController.dismiss(animated: false) {
                    self.present(menuLeftNavigationController, animated: true, completion: nil)
                }
            } else {
                self.present(menuLeftNavigationController, animated: true, completion: nil)
            }
        }
    }
    // Actions
    
    
//    func navigateToViewController(storyboardName: String, viewControllerIdentifier: String) {
//        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier)
//        self.navigationController?.pushViewController(viewController, animated: true)
//    }
//    
//    
//    @IBAction func HelloWorldScreenTapped(_ sender: Any) {
//        navigateToViewController(storyboardName: "HelloWorld", viewControllerIdentifier: "HellowWorldVC")
//    }
//    
//    @IBAction func heyScreenTapped(_ sender: Any) {
//        navigateToViewController(storyboardName: "HeyScreen", viewControllerIdentifier: "HeyScreenVC")
//    }
//    
//    @IBAction func biometricScreenTapped(_ sender: Any) {
//        navigateToViewController(storyboardName: "Biometric", viewControllerIdentifier: "BiometricVC")
//    }
//    
//    @IBAction func fheoryScreenTapped(_ sender: Any) {
//        navigateToViewController(storyboardName: "Fheory", viewControllerIdentifier: "FheoryVC")
//    }
//    
//    @IBAction func colorScreenTapped(_ sender: Any) {
//        navigateToViewController(storyboardName: "ColorScreen", viewControllerIdentifier: "ColorScreenVC")
//    }
//    
//    @IBAction func stackScreenTapped(_ sender: Any) {
//        navigateToViewController(storyboardName: "StackScreen", viewControllerIdentifier: "StackScreenVC")
//    }
//    
//    @IBAction func STTLSignInTapped(_ sender: Any) {
//        navigateToViewController(storyboardName: "STTLSignIn", viewControllerIdentifier: "STTLSignInVC")
//    }
//    
//    @IBAction func STTLSignUpTapped(_ sender: Any) {
//        navigateToViewController(storyboardName: "STTLSignUp", viewControllerIdentifier: "STTLSignUpVC")
//    }
//    
//
//    @IBAction func PrasharBhartiSignInTapped(_ sender: Any) {
//        navigateToViewController(storyboardName: "PrasharBhartiSignIn", viewControllerIdentifier: "PrasharBhartiSignInVC")
//    }
//    
//    @IBAction func CountryTapped(_ sender: Any) {
//        navigateToViewController(storyboardName: "CountryTable", viewControllerIdentifier: "CountryTableVC")
//    }
//    
//    @IBAction func StudentTapped(_ sender: Any) {
//        navigateToViewController(storyboardName: "StudentTable", viewControllerIdentifier: "StudentTableVC")
//    }
//    
//    
//    @IBAction func PeopleTapped(_ sender: Any) {
//        navigateToViewController(storyboardName: "PeopleTable", viewControllerIdentifier: "PeopleTableVC")
//    }
//    
//    @IBAction func PhotoGalleryTapped(_ sender: Any) {
//        navigateToViewController(storyboardName: "ComplexCollection", viewControllerIdentifier: "ComplexCollectionVC")
//    }
//    
//    @IBAction func TodoListTapped(_ sender: Any) {
//        navigateToViewController(storyboardName: "TodoList", viewControllerIdentifier: "TodoListVC")
//    }
}

