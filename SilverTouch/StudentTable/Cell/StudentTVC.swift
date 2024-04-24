//
//  StudentTVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 15/04/24.
//

import UIKit

class StudentTVC: UITableViewCell {

    
    @IBOutlet weak var circleView: UIView!
    
    @IBOutlet weak var mainLbl: UILabel!
    
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
        
        circleView.layer.cornerRadius = circleView.bounds.width / 2
        circleView.layer.borderColor = UIColor.pink.cgColor
        circleView.layer.borderWidth = 2
    }

    
    func setStudent(data:StudentModel){
        
        if !data.name.isEmpty {
            let capitalizedString = data.name.prefix(1).uppercased()
            mainLbl.text = capitalizedString
            nameLbl?.text = data.name
        }
        
        if  !data.dob.isEmpty{
            dobLbl?.text = data.dob
        }
        
        if !data.dob.isEmpty {
            departmentLbl?.text = data.department
        }
    }
    
    
    
    
}

extension UIColor {
    static let pink = UIColor(red: 255/255, green: 192/255, blue: 203/255, alpha: 1.0)
}
