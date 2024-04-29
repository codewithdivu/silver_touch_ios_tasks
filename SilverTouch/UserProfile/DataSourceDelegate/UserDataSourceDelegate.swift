//
//  UserDataSourceDelegate.swift
//  SilverTouch
//
//  Created by Divyesh  on 29/04/24.
//

import Foundation
import UIKit

class UserDataSourceDelegate: NSObject {
   
    
    internal var arrSource: UserModel
    internal var tblvw: UITableView
    internal var delegate: TblViewDelegate
    
    
    //MARK:- Initializers
    required init(arrData:  UserModel, delegate: TblViewDelegate, tbl: UITableView) {
        arrSource = arrData
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTbl()
    }
    
    fileprivate func setupTbl(){
        let nib = UINib(nibName: "UserProfileTVC", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "UserProfileTVC")
        tblvw.dataSource = self
        tblvw.delegate = self
        self.tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblvw.reloadData()
        
    }
    
    func reload(arr:UserModel){
        arrSource = arr
        tblvw.reloadData()
        
    }
    
}

extension UserDataSourceDelegate : UITableViewDataSource , UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tblvw, didSelectRowAt: indexPath)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSource.grades.count + 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserProfileTVC", for: indexPath)as! UserProfileTVC
        cell.setUser(data: arrSource, indexx: indexPath.row)
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
