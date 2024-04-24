//
//  CollectionSourceDelegate.swift
//  SilverTouch
//
//  Created by Divyesh  on 22/04/24.
//


import Foundation
import UIKit

protocol ColViewDelegate {
    func didSelect(colView: UICollectionView, indexPath: IndexPath)
}

class CollectionSourceDelegate: NSObject {
    
    typealias T = PersonModel
    typealias col = UICollectionView
    typealias del = ColViewDelegate
    typealias vc = UIViewController
    
    internal var arrSource: [T]
    internal var colvw: col
    internal var delegate: del
    internal weak var vc:vc?
    
    let kNumberOfItemsInOneRow: CGFloat = 2
    let kEdgeInset:CGFloat = 16
    let minimumInterItemandLinespacing:CGFloat = 12
    
    //MARK:- Initializers
    required init(arrData: [T], delegate: ColViewDelegate, col: UICollectionView,vc:vc) {
        arrSource = arrData
        colvw = col
        self.delegate = delegate
        self.vc = vc
        super.init()
        setupCol()
    }
    
    fileprivate func setupCol(){
        
        let nib = UINib(nibName: "ComplexCollectionCVC", bundle: nil)
        colvw.register(nib, forCellWithReuseIdentifier: "ComplexCollectionCVC")
        colvw.dataSource = self
        colvw.delegate = self
        colvw.reloadData()
    }
    
    func reload(arr:[T]){
        arrSource = arr
        colvw.reloadData()
    }
}

extension CollectionSourceDelegate:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.didSelect(colView: colvw, indexPath: indexPath)
    }
    
}
extension CollectionSourceDelegate:UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComplexCollectionCVC", for: indexPath) as! ComplexCollectionCVC
        cell.cellConfig(data: arrSource[indexPath.row])
        return cell
    }
}


//MARK:- UICollectionViewDelegateFlowLayout Methods
extension CollectionSourceDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInterItemandLinespacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInterItemandLinespacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 44) / 2
        let height = width + 40
        let lineHeight = "abc".height(withConstrainedWidth: width, font: .systemFont(ofSize: 14, weight: .regular))
        return .init(width: width, height: height + (lineHeight * 2))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: kEdgeInset, left: kEdgeInset, bottom: kEdgeInset, right: kEdgeInset)
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
}
