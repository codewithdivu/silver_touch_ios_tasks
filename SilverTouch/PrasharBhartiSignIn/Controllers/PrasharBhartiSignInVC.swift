//
//  PrasharBhartiSignInVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 11/04/24.
//

import UIKit

class PrasharBhartiSignInVC: UIViewController {

    // views outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var passwordView: UIView!

    // textfields outlets
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    // buttons outlets
    @IBOutlet weak var skipBtn: UIButton!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
    // labels outlets
    @IBOutlet weak var errorLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        errorView.isHidden = true
        mainView.layer.cornerRadius = 10.0
        
        passwordView.layer.borderWidth = 1.0
        passwordView.layer.borderColor = UIColor.lightGray.cgColor
        passwordView.layer.cornerRadius = 7.0
        
        emailField.layer.borderWidth = 1.0
        emailField.layer.cornerRadius = 7.0
        emailField.layer.borderColor = UIColor.lightGray.cgColor
        
        skipBtn.addUnderline(title: "SKIP", color: .black)
        
        // for scroll down little bit when user touch to password field
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(scrollDown))
        passwordField.addGestureRecognizer(tapGesture)
        
        // for giving shadow to error view
        errorView.layer.shadowColor = UIColor.black.cgColor
        errorView.layer.shadowOpacity = 0.5
        errorView.layer.shadowOffset = CGSize(width: 0, height: 2)
        errorView.layer.shadowRadius = 4
    
    }
    
    // methods
    

    // remember me tapped
    @IBAction func RememberMeTapped(_ sender: UIButton) {
        if sender.currentImage == UIImage(named: "unchecked") {
            sender.setImage(UIImage(named: "checked"), for: .normal)
        } else {
            sender.setImage(UIImage(named: "unchecked"), for: .normal)
        }
    }
    
    // eye tapped
    @IBAction func eyeTapped(_ sender: UIButton) {
        if passwordField.isSecureTextEntry {
            passwordField.isSecureTextEntry = false
            sender.setImage(UIImage(named: "eye"), for: .normal)
        }else{
            passwordField.isSecureTextEntry = true
            sender.setImage(UIImage(named: "hide"), for: .normal)
        }
    }
    
    // sign in tapped
    @IBAction func SignInTapped(_ sender: Any) {
        guard let email = emailField.text, !email.isEmpty else {
            showError(message: "Please enter your email.")
               return
           }
        guard isValidEmail(email) else {
            showError(message: "Please enter a valid email address.")
            return
        }
        guard let password = passwordField.text, !password.isEmpty else {
            showError(message: "Please enter your password.")
                return
            }
    }
    
    // sign in with phone number tapped
    @IBAction func SignInWithPhoneNumberTapped(_ sender: Any) {
    }
    
    // for showing banner error
    func showError(message: String) {

        errorLabel.text = message
                errorView.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.errorView.alpha = 1.0
        }
                
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.hideErrorBanner()
        }
    }
    
    // for hiding banner
    func hideErrorBanner() {
         UIView.animate(withDuration: 0.3) {
             self.errorView.alpha = 0.0
         } completion: { _ in
             self.errorView.isHidden = true
         }
     }

    // for validating email using regex
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    // for scrolling a scroll view
    @objc func scrollDown() {
        let offset: CGFloat = 100
        scrollView.setContentOffset(CGPoint(x: 0, y: offset), animated: true)
        passwordField.becomeFirstResponder()
    }
    
}


extension UIButton {
    func addUnderline(title: String, font: UIFont = UIFont.systemFont(ofSize: 16), color: UIColor = .black, underlineColor: UIColor = .black) {
        let attributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .font: font,
            .foregroundColor: color
        ]
        let attributedString = NSAttributedString(string: title, attributes: attributes)
        setAttributedTitle(attributedString, for: .normal)
        self.setTitleColor(underlineColor, for: .normal)
    }
}
