//
//  NewsListVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 01/05/24.
//

import UIKit

class NewsListVC: UIViewController {

    
    @IBOutlet weak var newsTableView: UITableView!
    var news : [NewsModel] = []
    
    var newsDataSourceDelegate : NewsDataSourceDelegate!
    var newsWebService = NewsWebService()


    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    
    func setupTblView(){
        if newsDataSourceDelegate == nil {
            newsDataSourceDelegate = .init(arr: news,tblv:newsTableView, del: self)
        }
    }
    
    func getData(){
        newsWebService.getNews{ arr in
            news = arr
        }
   
        setupTblView()
    }
    

    // back btn
    @IBAction func btnBusiness(_ sender: Any) {
        print("back Tapped")
    }
}



extension NewsListVC : NewsTblViewDelegate{
    func didselect(tbl: UITableView, indexPath: IndexPath) {
        let story = UIStoryboard(name: "News", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "NewsVC") as! NewsVC
        vc.newsID = news[indexPath.row].id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
