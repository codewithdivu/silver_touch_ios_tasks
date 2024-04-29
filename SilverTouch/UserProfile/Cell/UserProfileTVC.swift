//
//  UserProfileTVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 29/04/24.
//

import UIKit

class UserProfileTVC: UITableViewCell {

    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var lblDetailValue: UILabel!
    
    @IBOutlet weak var sepView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func getSemesterGrade(for index: Int) -> String {
        switch index {
        case 1:
            return "Sem one grade"
        case 2:
            return "Sem two grade"
        case 3:
            return "Sem three grade"
        case 4:
            return "Sem four grade"
        case 5:
            return "Sem five grade"
        case 6:
            return "Sem six grade"
        case 7:
            return "Sem seven grade"
        case 8:
            return "Sem eight grade"
        default:
            return "Sem more grade"
        }
    }
    
    func setUser(data:UserModel,indexx : Int){
        if(indexx == 0){
            lblDetail.text = "DOB"
            lblDetailValue.text = data.dob
        }else if(indexx == 1){
            lblDetail.text = "Student ID"
            lblDetailValue.text = String(data.id)
        }else if(indexx == 2){
            lblDetail.text = "Gender"
            lblDetailValue.text = data.gender
        }else if(indexx == data.grades.count+3){
            lblDetail.text = "Address"
            lblDetailValue.text = data.address
            sepView.isHidden = true
        }
        else{
            lblDetail.text = getSemesterGrade(for: indexx-3+1)
            lblDetailValue.text = String(data.grades[indexx-3])
        }
    }
}
