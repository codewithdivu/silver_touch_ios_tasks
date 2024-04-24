//
//  ComplexCollectionCVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 22/04/24.
//

import UIKit

class ComplexCollectionCVC: UICollectionViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var personImgView: UIImageView!
    
    @IBOutlet weak var PersonView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        PersonView.layer.cornerRadius = 12.0
        PersonView.layer.masksToBounds = true
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 4
        
    }
    
    func cellConfig(data:PersonModel){
        name.text = data.name
        personImgView.image = UIImage(named: data.img)
    }

}
