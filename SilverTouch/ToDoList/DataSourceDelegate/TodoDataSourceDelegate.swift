//
//  ToDoDataSourceDelegate.swift
//  SilverTouch
//
//  Created by Divyesh  on 22/04/24.
//

import Foundation
import UIKit

class TodoDataSourceDelegate: NSObject {
    
    typealias T = TodoModel
    typealias tbl = UITableView
    typealias del = TblViewDelegate
    
    internal var arrSource: [T]
    internal var tblvw: tbl
    internal var delegate: del
    internal var title: String?
    
    
    //MARK:- Initializers
    required init(arrData: [T], delegate: del, tbl: tbl) {
        arrSource = arrData
        tblvw = tbl
        self.delegate = delegate
        super.init()
        setupTbl()
    }
    
    fileprivate func setupTbl(){
        let nib = UINib(nibName: "TodoListTVC", bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: "TodoListTVC")
        tblvw.dataSource = self
        tblvw.delegate = self
        self.tblvw.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tblvw.reloadData()
        
    }
    
    func reload(arr:[T]){
        arrSource = arr
        tblvw.reloadData()
        
    }
    
    
}

extension TodoDataSourceDelegate:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didselect(tblvw, didSelectRowAt: indexPath)
    }
    
}

extension TodoDataSourceDelegate:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSource.count
    }
    
    @objc func addTodoAction(_ sender: UIButton) {
        let insertIndex = max(0, arrSource.count - 1)
        print(insertIndex)
        arrSource.insert(TodoModel(fromDictionary: ["title": title ?? "", "isShow": false]), at: insertIndex)
        reload(arr: arrSource)
        
//        if let buttonPosition = sender.superview?.convert(sender.frame.origin, to: tblvw),
//           let indexPath = tblvw.indexPathForRow(at: buttonPosition),
//           let cell = tblvw.cellForRow(at: indexPath) as? TodoListTVC {
//            cell.titleTextField.text = ""
//        }
        
        title = ""
        
    }
    
    @objc func deleteTodoAction(_sender:UIButton){
        let index = _sender.tag
        
        arrSource.remove(at: index)
        reload(arr: arrSource)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblvw.dequeueReusableCell(withIdentifier: "TodoListTVC", for: indexPath)as! TodoListTVC
        cell.configCell(data: arrSource[indexPath.row])
        cell.deleteBtn.tag = indexPath.row
        cell.addBtn.tag = indexPath.row
        cell.titleTextField.delegate = self
        
        
        cell.addBtn.addTarget(self, action: #selector(addTodoAction(_:)), for: .touchUpInside)
        cell.deleteBtn.addTarget(self, action: #selector(deleteTodoAction(_sender: )), for: .touchUpInside)
        return cell
    }
    
}


extension TodoDataSourceDelegate: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
    }
    
    @objc func valueChanged(_ sender: UITextField){
        title = sender.text
    }
    
}

