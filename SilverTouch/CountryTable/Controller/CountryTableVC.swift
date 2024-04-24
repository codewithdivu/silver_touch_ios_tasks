//
//  CountryTableVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 15/04/24.
//

import UIKit

class CountryTableVC: UIViewController, TblViewDelegate {
    
    func didselect(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(countries[indexPath.row])
    }
    

    @IBOutlet weak var countryTable: UITableView!
    
    var countries: [String] = ["India", "United States", "China", "Brazil", "Russia", "Germany", "United Kingdom", "France", "Italy", "Canada", "Australia", "Spain", "Mexico", "South Korea", "Indonesia", "Netherlands", "Saudi Arabia", "Turkey", "Switzerland", "Argentina"]

    var sampleDataSourceDelegate : SampleDataSourceDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCountryTblView()
    }
    
    func setupCountryTblView(){
        if sampleDataSourceDelegate == nil {
            sampleDataSourceDelegate = .init(arrData: countries, delegate: self, tbl: countryTable)
        }
    }


}
