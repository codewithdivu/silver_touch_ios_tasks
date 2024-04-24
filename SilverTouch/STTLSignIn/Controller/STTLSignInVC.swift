//
//  STTLSignInVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 12/04/24.
//

import UIKit

class STTLSignInVC: UIViewController {

    @IBOutlet var MainView: UIView!
    
    @IBOutlet weak var EmailField: UITextField!
    
    @IBOutlet weak var PasswordField: UITextField!
    
    @IBOutlet weak var eyeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PasswordField.isSecureTextEntry = true
    }
    
    @IBAction func eyeTapped(_ sender: Any) {
        if(PasswordField.isSecureTextEntry){
            PasswordField.isSecureTextEntry = false
            eyeBtn.setImage(UIImage(systemName: "eye"), for: .normal)
        }else{
            PasswordField.isSecureTextEntry = true
            eyeBtn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
   
}
