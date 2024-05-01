//
//  NewsListTVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 01/05/24.
//

import UIKit

class NewsListTVC: UITableViewCell {

    // outlets
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var headingLbl: UILabel!
    @IBOutlet weak var readAgoLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var bookmarkBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        mainView.layer.cornerRadius = 7.0
    }
    
    func setConfig(data:NewsModel){
        if let imageUrl = URL(string: data.imgUrl) {
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
        categoryLbl.text = data.category
        headingLbl.text = data.heading
        readAgoLbl.text = data.readAgo
        dateLbl.text = data.date
    }
    
    
    @IBAction func shareBtnTapped(_ sender: Any) {
        
    }
    
    @IBAction func bookmarkBtnTapped(_ sender: Any) {
        
    }
    
}
