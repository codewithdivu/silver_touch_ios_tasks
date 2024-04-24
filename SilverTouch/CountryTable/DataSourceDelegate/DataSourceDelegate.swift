//
//  DataSourceDelegate.swift
//  SilverTouch
//
//  Created by Divyesh  on 15/04/24.
//


protocol TblViewDelegate {
    func didselect (_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}



import Foundation
import UIKit

class SampleDataSourceDelegate: NSObject {
   
    
    internal var arrSource: [String]
    internal var tblvw: UITableView
    internal var delegate: TblViewDelegate
    
    
    //MARK:- Initializers
    required init(arrData:  [String], delegate: TblViewDelegate, tbl: UITableView) {
        arrSource = arrData
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTbl()
    }
    
    fileprivate func setupTbl(){
        let nib = UINib(nibName: "CountryTVC", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "CountryTVC")
        tblvw.dataSource = self
        tblvw.delegate = self
        self.tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblvw.reloadData()
        
    }
    
    func reload(arr:[String]){
        arrSource = arr
        tblvw.reloadData()
        
    }
    
}

extension SampleDataSourceDelegate : UITableViewDataSource , UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tblvw, didSelectRowAt: indexPath)
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTVC", for: indexPath)as! CountryTVC
        cell.setCountry(country: arrSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
   
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .insert {
            
        }
    }

}
