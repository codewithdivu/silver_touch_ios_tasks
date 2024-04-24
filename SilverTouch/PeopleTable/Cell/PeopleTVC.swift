//
//  PeopleTVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 17/04/24.
//

import UIKit

class PeopleTVC: UITableViewCell {

    @IBOutlet weak var personView: UIView!
    @IBOutlet weak var personImage: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var dobLbl: UILabel!
    @IBOutlet weak var departmentLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        personView.layer.cornerRadius = personView.bounds.width/2
        personView.layer.borderColor = UIColor.systemPink.cgColor
        personView.layer.borderWidth = 2
    }
    
    func setConfig(data:PeopleModel){
        if  !data.name.isEmpty{
            nameLbl?.text = data.name
        }
        if  !data.dob.isEmpty{
            dobLbl?.text = data.dob
        }
        if  !data.department.isEmpty{
            departmentLbl?.text = data.department
        }
//        if let imageName = data.img {
//            personImage?.image = UIImage(named: imageName)
//        }

    }
    
}


