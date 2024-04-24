//
//  TodoListTVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 22/04/24.
//

import UIKit

class TodoListTVC: UITableViewCell {
    
    @IBOutlet weak var TodoView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var textFieldStackView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(data:TodoModel){
        titleTextField.text = ""
        lblTitle.text = data.title
        if(data.isShow){
            TodoView.isHidden = true
            textFieldStackView.isHidden = false
        }else{
            textFieldStackView.isHidden = true
            TodoView.isHidden = false
        }
    };
        
    
    
}
