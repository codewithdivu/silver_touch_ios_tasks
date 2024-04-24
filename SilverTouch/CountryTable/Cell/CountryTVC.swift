//
//  CountryTVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 15/04/24.
//

import UIKit

class CountryTVC: UITableViewCell {

    @IBOutlet weak var countryLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCountry(country:String){
        countryLbl.text = country
    }
    
}
