//
//  PeopleTableVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 17/04/24.
//

import UIKit

class PeopleTableVC: UIViewController, TblViewDelegate {
    func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    @IBOutlet weak var PeopleTableView: UITableView!
    
    var peopleWebService = PeopleWebService()
    
    var peopleDataSourceDelegate : PeopleDataSourceDelegate!
    
    var people : [PeopleModel] = []
    var sectionViseData: [String: [PeopleModel]] = [:]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData(){
        peopleWebService.getPeople{ arr in
            people = arr
            let groupedPeople = Dictionary(grouping: arr) { people in
                return String(people.name.first ?? Character(""))
            }
            let sortedPeople = groupedPeople.sorted(by: { $0.key < $1.key })
            print(sortedPeople)
            for (key, peopleWithKey) in sortedPeople {
                sectionViseData[key] = peopleWithKey
            }
           
            print(sectionViseData)
        }
        setupTblView()
    }
    
    func setupTblView(){
        if peopleDataSourceDelegate == nil {
            peopleDataSourceDelegate = .init(arrSource: sectionViseData,tblvw: PeopleTableView,delegate: self)
        }
    }

}
