//
//  StudentTableVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 15/04/24.
//

import UIKit

class StudentTableVC: UIViewController, TblViewDelegate {
    
    func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(students[indexPath.row])
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
            print(arr)
        }
        setupTblView()
    }
    
    func setupTblView(){
        if studentDataSourceDelegate == nil {
            studentDataSourceDelegate = .init(arrData: students, delegate: self, tbl: studentTableView)
        }
    }

}


//    var students: [[String: String]] = [
//        ["Name": "Divyesh", "DOB": "17-08-2003", "Department": "ios"],
//        ["Name": "Priya", "DOB": "25-05-2000", "Department": "android"],
//        ["Name": "Ananya", "DOB": "12-12-1998", "Department": "web"],
//        ["Name": "Vikram", "DOB": "03-04-2002", "Department": "backend"],
//        ["Name": "Kavya", "DOB": "19-09-2001", "Department": "frontend"],
//        ["Name": "Aarav", "DOB": "08-11-1999", "Department": "ios"],
//        ["Name": "Neha", "DOB": "30-07-2004", "Department": "android"],
//        ["Name": "Raj", "DOB": "15-06-2000", "Department": "web"],
//        ["Name": "Aarti", "DOB": "10-10-2002", "Department": "backend"],
//        ["Name": "Sanjay", "DOB": "02-03-2003", "Department": "frontend"],
//        ["Name": "Pooja", "DOB": "07-09-1997", "Department": "ios"]
//    ]
