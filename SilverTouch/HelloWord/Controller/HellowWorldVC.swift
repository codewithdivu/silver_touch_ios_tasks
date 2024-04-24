//
//  HellowWorldVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 12/04/24.
//

import UIKit

class HellowWorldVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
