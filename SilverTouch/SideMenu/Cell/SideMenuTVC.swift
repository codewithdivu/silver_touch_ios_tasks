//
//  SideMenuTVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 22/04/24.
//

import UIKit

class SideMenuTVC: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var titleIcon: UIImageView!
    
    @IBOutlet weak var sepView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configCell(data : SideMenuModel){
        lblTitle.text = data.TitleKey
        titleIcon.image = UIImage(systemName: data.Image)
    }
}
