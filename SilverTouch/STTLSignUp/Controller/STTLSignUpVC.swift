//
//  STTLSignUpVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 12/04/24.
//

import UIKit

class STTLSignUpVC: UIViewController {

    // textfields outlets
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var otpField: UITextField!
    
    // views outlets
    @IBOutlet weak var orView: UIView!
    
    // btn outlets
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var rememberMeBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if((UserDefaults.standard.string(forKey: "email")) != nil && (UserDefaults.standard.string(forKey: "password")) != nil){
            navigateToViewController(storyboardName: "Main", viewControllerIdentifier: "ViewController")
        }
        
        // initially passwordField with security
        passwordField.isSecureTextEntry = true
        
        // OR Button border nad borderradius
        orView.layer.borderWidth = 1.0
        orView.layer.cornerRadius = 5.0
        orView.layer.borderColor = UIColor.lightGray.cgColor
        
        
        // underline fot SIGNUP button
        let attributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .font: UIFont.systemFont(ofSize: 16)
        ]
        let attributedString = NSAttributedString(string: "SIGNUP", attributes: attributes)
        signUpBtn.setAttributedTitle(attributedString, for: .normal)

    }

    
    // eye button handler
    @IBAction func eyeTapped(_ sender: UIButton) {
        if passwordField.isSecureTextEntry {
            passwordField.isSecureTextEntry = false
            sender.setImage(UIImage(systemName: "eye"), for: .normal)
        }else{
            passwordField.isSecureTextEntry = true
            sender.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
    
    // resendOtp button handler
    @IBAction func resendOtpTapped(_ sender: Any) {
        otpField.text = String(generateRandomSixDigitNumber())
    }
    
    
    // remember me button handler
    @IBAction func rememberMeTapped(_ sender: UIButton){
        if sender.currentImage == UIImage(named: "uncheckedViolet") {
            sender.setImage(UIImage(named: "checkbox"), for: .normal)
        } else {
            sender.setImage(UIImage(named: "uncheckedViolet"), for: .normal)
        }
    }
    
    // clear button handler
    @IBAction func clearTapped(_ sender: Any) {
        emailField.text = ""
        passwordField.text = ""
        otpField.text = ""
    }
    
    // login button handler
    @IBAction func loginTapped(_ sender: Any) {
        
        guard let email = emailField.text, !email.isEmpty else {
            showAlert(message: "Email cannot be empty")
            return
        }
        guard isValidEmail(email) else {
            showAlert(message: "Please enter a valid email address.")
            return
        }
        guard let password = passwordField.text, !password.isEmpty else {
            showAlert(message: "Password cannot be empty")
            return
        }
        guard let otp = otpField.text, !otp.isEmpty else {
            showAlert(message: "Otp cannot be empty")
            return
        }
        guard isValidOTP(otp) else {
            showAlert(message: "OTP must contain exactly 6 digits")
            return
        }

        if(rememberMeBtn.currentImage == UIImage(named: "checkbox")){
            UserDefaults.standard.set(emailField.text, forKey: "email")
            UserDefaults.standard.set(passwordField.text, forKey: "password")
            UserDefaults.standard.set(otpField.text, forKey: "otp")
        }
        navigateToViewController(storyboardName: "Main", viewControllerIdentifier: "ViewController")
    }
    
    // for validating email using regex
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    // for validating otp using regex
    func isValidOTP(_ otp: String) -> Bool {
        let otpRegex = "^\\d{6}$"
        let otpPredicate = NSPredicate(format: "SELF MATCHES %@", otpRegex)
        return otpPredicate.evaluate(with: otp)
    }
    
    // function for showing alert pop-up
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Validation Error", message: message, preferredStyle: .alert)
        let attributedMessage = NSAttributedString(string: message, attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
        alert.setValue(attributedMessage, forKey: "attributedMessage")
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    // function for navigating
    func navigateToViewController(storyboardName: String, viewControllerIdentifier: String) {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    // for generating 6-digit otp
    
    func generateRandomSixDigitNumber() -> Int {
        let randomNumber = Int(arc4random_uniform(900000) + 100000)
        return randomNumber
    }

    
}
