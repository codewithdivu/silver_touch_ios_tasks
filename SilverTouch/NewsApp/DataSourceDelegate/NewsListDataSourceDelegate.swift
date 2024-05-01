//
//  NewsListDataSourceDelegate.swift
//  SilverTouch
//
//  Created by Divyesh  on 01/05/24.
//

import Foundation


protocol NewsTblViewDelegate {
    func didselect(tbl: UITableView, indexPath: IndexPath)
}

import UIKit
class NewsDataSourceDelegate : NSObject {
    
    typealias tblview = UITableView
    typealias delegate = NewsTblViewDelegate
    
    var arr : [NewsModel]
    var tblv  : tblview
    var del : delegate
    fileprivate var selectedSection: IndexPath?
    
    init(arr:[NewsModel],tblv : tblview , del : delegate){
        self.arr = arr
        self.tblv = tblv
        self.del = del
        super.init()
        setupTableView()
    }
    
    func reload(arr : [NewsModel] , selectedSection : IndexPath) {
        self.arr = arr
        self.selectedSection = selectedSection
        tblv.reloadData()
    }
    
    
    
    fileprivate func setupTableView(){
        let nib = UINib(nibName: "NewsListTVC", bundle: nil)
        tblv.register(nib, forCellReuseIdentifier: "NewsListTVC")
        tblv.delegate = self
        tblv.dataSource = self
    }
}



extension NewsDataSourceDelegate : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        del.didselect(tbl: tblv, indexPath: indexPath)
    }
}


extension NewsDataSourceDelegate :UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    @objc func bookMarkNews(_ sender: UIButton) {
        let rowIndex = sender.tag
        arr[rowIndex].isBookmarked = !arr[rowIndex].isBookmarked
        sender.tag = 0
        tblv.reloadData()
    }
    
    @objc func shareNews(_ sender: UIButton){
        let rowIndex = sender.tag
        let newsHeading = arr[rowIndex].heading
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsData = arr[indexPath.row]
        let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsListTVC", for: indexPath) as! NewsListTVC
        newsCell.setConfig(data: newsData)
        newsCell.bookmarkBtn.tag = indexPath.row
        newsCell.bookmarkBtn.addTarget(self, action: #selector(bookMarkNews(_:)), for: .touchUpInside)
        let image = arr[indexPath.row].isBookmarked ? UIImage(systemName: "bookmark.fill") : UIImage(systemName: "bookmark")
        newsCell.bookmarkBtn.setImage(image, for: .normal)
        
        newsCell.shareBtn.tag = indexPath.row
        newsCell.shareBtn.addTarget(self, action: #selector(shareNews(_:)), for: .touchUpInside)
        
        
        
        return newsCell
        
    }
}

