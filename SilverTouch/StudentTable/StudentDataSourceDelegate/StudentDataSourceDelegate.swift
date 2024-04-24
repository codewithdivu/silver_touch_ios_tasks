//
//  StudentDataSourceDelegate.swift
//  SilverTouch
//
//  Created by Divyesh  on 16/04/24.
//



import Foundation
import UIKit

class StudentDataSourceDelegate: NSObject {
   
    
    internal var arrSource: [StudentModel]
    internal var tblvw: UITableView
    internal var delegate: TblViewDelegate
    
    
    //MARK:- Initializers
    required init(arrData:  [StudentModel], delegate: TblViewDelegate, tbl: UITableView) {
        arrSource = arrData
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTbl()
    }
    
    fileprivate func setupTbl(){
        let nib = UINib(nibName: "StudentTVC", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "StudentTVC")
        tblvw.dataSource = self
        tblvw.delegate = self
        self.tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblvw.reloadData()
        
    }
    
    func reload(arr:[StudentModel]){
        arrSource = arr
        tblvw.reloadData()
        
    }
    
}

extension StudentDataSourceDelegate : UITableViewDataSource , UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tblvw, didSelectRowAt: indexPath)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentTVC", for: indexPath)as! StudentTVC
        cell.setStudent(data: arrSource[indexPath.row])
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
