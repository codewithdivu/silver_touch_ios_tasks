//
//  NewsVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 01/05/24.
//

import UIKit

class NewsVC: UIViewController {
    

    // variables
    var newsID : Int!
    var newsWebService = NewsWebService()
    var news : NewsModel?
    var allNews : [NewsModel] = []
    var filteredNews : [NewsModel] = []
    var newsCollectionDataSourceDelegate : NewsCollectionDataSourceDelegate!

    
    // outlets
    @IBOutlet weak var newsCollectionView: UICollectionView!
    @IBOutlet weak var bookmarkBtn: UIButton!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var headingLbl: UILabel!
    @IBOutlet weak var timeAgo: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        let image = news!.isBookmarked ? UIImage(systemName: "bookmark.fill") : UIImage(systemName: "bookmark")
           bookmarkBtn.setImage(image, for: .normal)
        
        headingLbl.text = news?.heading
        timeAgo.text = news?.readAgo
        dateLbl.text = news?.date
        timeLbl.text = news?.time
        contentLbl.text = news?.content
        
        // for set up the image from url to image view
        if let imageUrl = URL(string: news?.imgUrl ?? "") {
             let task = URLSession.shared.dataTask(with: imageUrl) { [weak self] (data, response, error) in
                 guard let data = data, let image = UIImage(data: data) else {
                     if let error = error {
                         print("Error loading image: \(error)")
                     }
                     return
                 }
                 DispatchQueue.main.async {
                     self?.newsImage.image = image
                 }
             }
             task.resume()
         }
        
    }
    
    // back button action
    @IBAction func backBtnTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    func getData(){
        newsWebService.getNews{ arr in
            allNews = arr
            let arrr = arr.filter { $0.id == newsID }
            news = arrr[0]
            let newArr = arr.filter{ $0.category == news?.category && $0.id != news?.id}
            filteredNews = newArr
        }
        setupColView()
    }
    
    func setupColView(){
        if newsCollectionDataSourceDelegate == nil {
            newsCollectionDataSourceDelegate = .init(arrData: filteredNews, delegate: self, col: newsCollectionView,vc:self)
        }
    }
    // share btn action
    @IBAction func shareBtnTapped(_ sender: Any) {
        let newsHeading = news?.heading
        let newsUrl = URL(string: "https://leetcode.com/problemset/")
        let data: [Any] = [newsHeading, newsUrl ?? "www.google.com"].compactMap { $0 }
        let activityViewController = UIActivityViewController(activityItems: data, applicationActivities: nil)
        if let viewController = UIApplication.shared.keyWindow?.rootViewController {
                 viewController.present(activityViewController, animated: true, completion: nil)
             }
        activityViewController.completionWithItemsHandler = { (activityType, completed, returnedItems, error) in
                   if completed {
                       print("Shared successfully")
                   } else {
                       print("Sharing cancelled or failed")
                   }
               }
    }
    // bookmarked btn action
    @IBAction func bookmarkBtnTapped(_ sender: UIButton) {
        news?.isBookmarked = !(news?.isBookmarked ?? false)
        let image = news!.isBookmarked ? UIImage(systemName: "bookmark.fill") : UIImage(systemName: "bookmark")
           sender.setImage(image, for: .normal)
//        newsCollectionDataSourceDelegate.reload(arr: filteredNews)
    }
    
}


extension NewsVC : CollectionViewDelegate{
    func didSelect(colView: UICollectionView, indexPath: IndexPath) {
//        let story = UIStoryboard(name: "News", bundle: nil)
//        let vc = story.instantiateViewController(withIdentifier: "NewsVC") as! NewsVC
//        vc.newsID = news?.id ?? 0
//        newsID = news?.id
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
