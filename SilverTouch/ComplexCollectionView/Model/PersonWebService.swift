//
//  PersonWebService.swift
//  SilverTouch
//
//  Created by Divyesh  on 22/04/24.
//

import Foundation

class PersonWebService : NSObject{
    
    func getPeople(block : ([PersonModel]) -> Swift.Void){
        var res : [PersonModel] = []
        let dict = readJsonFile(ofName: "PeopleList")
        if let arr = dict["people"] as? [[String:Any]]{
            res = arr.map({PersonModel(fromDictionary: $0)})
        }
        block(res)
    }
    
    
    
    func readJsonFile(ofName: String) -> [String : Any] {
        guard let strPath = Bundle.main.path(forResource: ofName, ofType: ".json") else {
            return [:]
        }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: strPath), options: .alwaysMapped)
            
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let dictJson = jsonResult as? [String : Any] {
                return dictJson
            }
        } catch {
            print("Error!! Unable to parse ")
        }
        return [:]
    }
}
