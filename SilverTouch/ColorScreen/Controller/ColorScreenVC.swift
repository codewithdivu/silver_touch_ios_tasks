//
//  ColorScreenVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 12/04/24.
//

import UIKit

class ColorScreenVC: UIViewController {

    @IBOutlet var MainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func HandleCoolTapped(_ sender: Any) {
        MainView.backgroundColor = UIColor.blue
    }
    
    @IBAction func BackTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func HandleWarmTapped(_ sender: Any) {
        MainView.backgroundColor = UIColor.systemPink
    }
}
