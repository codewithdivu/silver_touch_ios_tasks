//
//  StudentTableVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 15/04/24.
//

import UIKit


class StudentTableVC: UIViewController, TblViewDelegate {
    
    func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let story = UIStoryboard(name: "UserProfile", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "UserProfileVC") as! UserProfileVC
        vc.studentID = students[indexPath.row].id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBOutlet weak var studentTableView: UITableView!
    
    var studentWebService = StudentWebService()
    
    var students : [StudentModel] = []
    
    var studentDataSourceDelegate : StudentDataSourceDelegate!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData(){
        studentWebService.getStudents{ arr in
            students = arr
        }
        setupTblView()
    }
    
    func setupTblView(){
        if studentDataSourceDelegate == nil {
            studentDataSourceDelegate = .init(arrData: students, delegate: self, tbl: studentTableView)
        }
    }

}
