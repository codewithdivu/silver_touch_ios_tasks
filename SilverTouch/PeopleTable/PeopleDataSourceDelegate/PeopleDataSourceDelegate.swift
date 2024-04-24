//
//  PeopleDataSourceDelegate.swift
//  SilverTouch
//
//  Created by Divyesh  on 17/04/24.
//

import Foundation
import UIKit

class PeopleDataSourceDelegate : NSObject{
    internal var arrSource: [String: [PeopleModel]]
    internal var tblvw: UITableView
    internal var delegate: TblViewDelegate
    
    required init(arrSource: [String: [PeopleModel]], tblvw: UITableView, delegate: TblViewDelegate) {
        self.arrSource = arrSource
        self.tblvw = tblvw
        self.delegate = delegate
        super.init()
        setupTbl()
    }
    
    fileprivate func setupTbl(){
        let nib = UINib(nibName: "PeopleTVC", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "PeopleTVC")
        tblvw.dataSource = self
        tblvw.delegate = self
        self.tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblvw.reloadData()
    }
    
    func reload(arr:[String: [PeopleModel]]){
        arrSource = arr
        tblvw.reloadData()
    }
    
}


extension PeopleDataSourceDelegate : UITableViewDataSource, UITableViewDelegate{

    func numberOfSections(in tableView: UITableView) -> Int {
        return arrSource.keys.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(arrSource.keys)[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Array(arrSource.values)[section].count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleTVC", for: indexPath)as! PeopleTVC
        cell.setConfig(data:Array(arrSource.values)[indexPath.section][indexPath.row])
        return cell
    }
}
