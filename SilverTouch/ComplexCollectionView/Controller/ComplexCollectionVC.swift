//
//  ComplexCollectionVC.swift
//  SilverTouch
//
//  Created by Divyesh  on 22/04/24.
//

import UIKit

class ComplexCollectionVC: UIViewController, ColViewDelegate {
    func didSelect(colView: UICollectionView, indexPath: IndexPath) {
        
    }

    
    @IBOutlet weak var PersonCollectionView: UICollectionView!
    
    var personWebService = PersonWebService()
    
    var personDataSourceDelegate : CollectionSourceDelegate!
    
    var person : [PersonModel] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData(){
        personWebService.getPeople{ arr in
            person = arr
        }
        setupTblView()
    }
    
    func setupTblView(){
        if personDataSourceDelegate == nil {
            personDataSourceDelegate = .init(arrData: person, delegate: self, col: PersonCollectionView,vc:self)
        }
    }
    
}
