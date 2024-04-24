//
//  TodoListVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 22/04/24.
//

import UIKit

class TodoListVC: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!

    var arr : [TodoModel] = [TodoModel(fromDictionary: ["title": "Hello World!", "isShow": true])]
    var todoDataSourceDelegate : TodoDataSourceDelegate!


    override func viewDidLoad() {
        super.viewDidLoad()
        setupTblView()
        print(arr)
    }
    
    func setupTblView(){
        if todoDataSourceDelegate == nil {
            todoDataSourceDelegate = .init(arrData: arr, delegate: self, tbl: tblView)
        }
    }
    
}

extension TodoListVC : TblViewDelegate {
    func didselect(_ tbl: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
