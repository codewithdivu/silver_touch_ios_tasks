//
//  SideMenuVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 22/04/24.
//

import UIKit

class SideMenuVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var arr : [SideMenuModel] = []
    
    var sideMenuDataSourceDelegate : SidemenuDataSourceDelegate!

    @IBOutlet weak var personImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTblView()
        personImageView.layer.cornerRadius = personImageView.frame.width/2
        personImageView.layer.masksToBounds = true
        personImageView.layer.borderWidth = 2.0
        personImageView.layer.borderColor = UIColor.black.cgColor
        
    }

    
    func readPropertyList(ofName: String) -> Any? {
        if let path = Bundle.main.path(forResource: ofName, ofType: "plist") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl, options: .init(rawValue: 0))
                let plistData = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
                return plistData
            } catch let error {
                debugPrint(error.localizedDescription)
            }
        }
        return nil
    }
    
    func setUpTblView(){
        if let arr = readPropertyList(ofName: "SideMenuList") as? [[String:Any]] {
            self.arr = arr.map({ SideMenuModel(dict: $0) })
        }
        if sideMenuDataSourceDelegate == nil {
            sideMenuDataSourceDelegate = .init(arr: arr, tblv: tableView, del: self)
        }
    }
    

}

extension SideMenuVC : SideMenuTblViewDelegate{
    func didselect(tbl: UITableView, indexPath: IndexPath) {
        
        let story = UIStoryboard(name: arr[indexPath.row].storyboardID, bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: arr[indexPath.row].ControllerName)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
