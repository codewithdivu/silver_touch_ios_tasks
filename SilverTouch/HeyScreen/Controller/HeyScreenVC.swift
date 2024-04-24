//
//  HeyScreenVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 12/04/24.
//

import UIKit

class HeyScreenVC: UIViewController {
    @IBOutlet weak var TextViewOutlet: UIView!
    
    @IBOutlet weak var NameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextViewOutlet.layer.cornerRadius = TextViewOutlet.frame.height/2
        TextViewOutlet.layer.masksToBounds = true
    }

    @IBAction func skipTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func handleNext(_ sender: Any) {
        
    }
}
