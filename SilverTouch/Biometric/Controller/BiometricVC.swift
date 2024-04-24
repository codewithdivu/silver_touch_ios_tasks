//
//  BiometricVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 12/04/24.
//

import UIKit

class BiometricVC: UIViewController {
    
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var RegistraionBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RegistraionBtn.layer.cornerRadius = 20.0
        RegistraionBtn.layer.borderWidth = 2.0
        RegistraionBtn.layer.borderColor = UIColor.white.cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = mainView.bounds

        let lightOrangeColor = UIColor(red: 1.0, green: 0.8, blue: 0.4, alpha: 1.0).cgColor
        let orangeColor = UIColor.orange.cgColor
        gradientLayer.colors = [lightOrangeColor, orangeColor]

        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)

        mainView.layer.addSublayer(gradientLayer)

        for subview in mainView.subviews {
            mainView.bringSubviewToFront(subview)
        }
    }
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func HandleLoginAction(_ sender: UIButton) {

    }
}

