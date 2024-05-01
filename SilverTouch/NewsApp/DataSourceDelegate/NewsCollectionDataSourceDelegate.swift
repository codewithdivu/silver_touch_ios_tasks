//
//  NewsDataSourceDelegate.swift
//  SilverTouch
//
//  Created by Divyesh  on 01/05/24.
//

import Foundation
import UIKit

protocol CollectionViewDelegate {
    func didSelect(colView: UICollectionView, indexPath: IndexPath)
}

protocol NewsCollectionViewDelegate: AnyObject {
    func reloadData()
}

class NewsCollectionDataSourceDelegate: NSObject {
    
    typealias T = NewsModel
    typealias col = UICollectionView
    typealias del = CollectionViewDelegate
    typealias vc = UIViewController
    
    internal var arrSource: [T]
    internal var colvw: col
    internal var delegate: del
    internal weak var vc:vc?
    
    let kNumberOfItemsInOneRow: CGFloat = 1.5
    let kEdgeInset:CGFloat = 16
    let minimumInterItemandLinespacing:CGFloat = 12
    
    //MARK:- Initializers
    required init(arrData: [T], delegate: CollectionViewDelegate, col: UICollectionView,vc:vc) {
        arrSource = arrData
        colvw = col
        self.delegate = delegate
        self.vc = vc
        super.init()
        setupCol()
    }
    
    fileprivate func setupCol(){
        
        let nib = UINib(nibName: "NewsCVC", bundle: nil)
        colvw.register(nib, forCellWithReuseIdentifier: "NewsCVC")
        colvw.dataSource = self
        colvw.delegate = self
        colvw.reloadData()
    }
    
    func reload(arr:[T]){
        arrSource = arr
        colvw.reloadData()
    }
}

extension NewsCollectionDataSourceDelegate:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.didSelect(colView: colvw, indexPath: indexPath)
    }
    
}
extension NewsCollectionDataSourceDelegate:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    @objc func bookMarkNews(_ sender: UIButton) {
        let rowIndex = sender.tag
        arrSource[rowIndex].isBookmarked = !arrSource[rowIndex].isBookmarked
        sender.tag = 0
        colvw.reloadData()
    }
    
    @objc func shareNews(_ sender: UIButton){
        let rowIndex = sender.tag
        let newsHeading = arrSource[rowIndex].heading
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
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCVC", for: indexPath) as! NewsCVC
        cell.cellConfig(data: arrSource[indexPath.row])
        
        cell.bookmarkedBtn.tag = indexPath.row
        cell.bookmarkedBtn.addTarget(self, action: #selector(bookMarkNews(_:)), for: .touchUpInside)
        
        let image = arrSource[indexPath.row].isBookmarked ? UIImage(systemName: "bookmark.fill") : UIImage(systemName: "bookmark")
        cell.bookmarkedBtn.setImage(image, for: .normal)
        
        cell.shareBtn.tag = indexPath.row
        cell.shareBtn.addTarget(self, action: #selector(shareNews(_:)), for: .touchUpInside)

        return cell
    }
}


//MARK:- UICollectionViewDelegateFlowLayout Methods
extension NewsCollectionDataSourceDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInterItemandLinespacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInterItemandLinespacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width) / 1.5
        let height = width
        let lineHeight = "abc".height(withConstrainedWidth: width, font: .systemFont(ofSize: 14, weight: .regular))
        return .init(width: width, height: height + (lineHeight * 2))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: kEdgeInset, left: kEdgeInset, bottom: kEdgeInset, right: kEdgeInset)
    }
}
