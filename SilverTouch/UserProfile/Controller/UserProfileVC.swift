//
//  UserProfileVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 29/04/24.
//

import UIKit

class UserProfileVC: UIViewController, TblViewDelegate {
    func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    // states
    var studentID : Int!

    // table view outlet
    @IBOutlet weak var tableView: UITableView!

    // views outlets
    
    @IBOutlet weak var UserView: UIView!
    @IBOutlet weak var UserDetailView: UIView!
    @IBOutlet weak var UserCircleView: UIView!
    
    // labels outlets
    @IBOutlet weak var lblUserNameAlphabetLbl: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblDepartment: UILabel!
    @IBOutlet weak var lblStudentId: UILabel!
    @IBOutlet weak var lblSportName: UILabel!
    
    var userWebService = UserWebService()
    var users : UserModel?
    var userDataSourceDelegate : UserDataSourceDelegate!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblStudentId.text = String(studentID)
        getData()
        lblUserName.text = users?.name
        lblUserNameAlphabetLbl.text = users?.name.prefix(1).uppercased()
        lblDepartment.text = users?.department
        lblSportName.text = users?.sportsName        
    }
    
    override func viewDidLayoutSubviews() {
        UserCircleView.layer.cornerRadius = UserCircleView.bounds.width/2
        UserCircleView.layer.borderWidth = 3.0
        UserCircleView.layer.borderColor = UIColor.pink.cgColor
        UserDetailView.layer.cornerRadius = 10.0

        UserView.layer.cornerRadius = 10.0
        UserView.layer.masksToBounds = false
        UserView.layer.shadowColor = UIColor.black.cgColor
        UserView.layer.shadowOpacity = 0.3
        UserView.layer.shadowOffset = CGSize(width: 0, height: 4)
        UserView.layer.shadowRadius = 4
        
        lblUserNameAlphabetLbl.textColor = UIColor.systemPink
    }
    
    func getData(){
        userWebService.getUsers{ arr in
            let arrr = arr.filter { $0.id == studentID }
            users = arrr[0]
        }
        setupTblView()
    }
    

    
    func setupTblView(){
        if userDataSourceDelegate == nil {
            userDataSourceDelegate = .init(arrData: users!, delegate: self, tbl: tableView)
        }
    }
  
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
