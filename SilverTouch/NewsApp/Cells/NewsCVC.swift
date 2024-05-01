//
//  NewsCVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 01/05/24.
//

import UIKit

class NewsCVC: UICollectionViewCell {

    @IBOutlet weak var headinLbl: UILabel!
    @IBOutlet weak var readAgoLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var bookmarkedBtn: UIButton!
    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var shareBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 20.0
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 4
    }
    
    func cellConfig(data:NewsModel){
        headinLbl.text = data.heading
        readAgoLbl.text = data.readAgo
        dateLbl.text = data.date
     
        if let imageUrl = URL(string:data.imgUrl) {
             let task = URLSession.shared.dataTask(with: imageUrl) { [weak self] (data, response, error) in
                 guard let data = data, let image = UIImage(data: data) else {
                     if let error = error {
                         print("Error loading image: \(error)")
                     }
                     return
                 }
                 DispatchQueue.main.async {
                     self?.newsImg.image = image
                 }
             }
             task.resume()
         }
    }
    
    @IBAction func bookmarkBtnTapped(_ sender: Any) {
    }
    
    @IBAction func shareBtnTapped(_ sender: Any) {
    }
    
    
}
