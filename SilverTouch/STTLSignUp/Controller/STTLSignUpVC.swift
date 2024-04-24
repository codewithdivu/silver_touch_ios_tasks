//
//  STTLSignUpVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 12/04/24.
//

import UIKit

class STTLSignUpVC: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var otpField: UITextField!
    
    @IBOutlet weak var orView: UIView!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.isSecureTextEntry = true
        orView.layer.borderWidth = 1.0
        orView.layer.cornerRadius = 5.0
        orView.layer.borderColor = UIColor.lightGray.cgColor
        
        
        let attributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .font: UIFont.systemFont(ofSize: 16)
        ]
        let attributedString = NSAttributedString(string: "SIGNUP", attributes: attributes)
        
        
        signUpBtn.setAttributedTitle(attributedString, for: .normal)

    }

    @IBAction func eyeTapped(_ sender: UIButton) {
        if passwordField.isSecureTextEntry {
            passwordField.isSecureTextEntry = false
            sender.setImage(UIImage(systemName: "eye"), for: .normal)
        }else{
            passwordField.isSecureTextEntry = true
            sender.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
    
    @IBAction func rememberMeTapped(_ sender: UIButton){
        if sender.currentImage == UIImage(named: "uncheckedViolet") {
            sender.setImage(UIImage(named: "checkbox"), for: .normal)
        } else {
            sender.setImage(UIImage(named: "uncheckedViolet"), for: .normal)
        }
    }
    
    @IBAction func clearTapped(_ sender: Any) {
        emailField.text = ""
        passwordField.text = ""
        otpField.text = ""
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        print(emailField.text ?? "")
        print(passwordField.text ?? "")
        print(otpField.text ?? "")
        
        emailField.text = ""
        passwordField.text = ""
        otpField.text = ""
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
    }
    
}
