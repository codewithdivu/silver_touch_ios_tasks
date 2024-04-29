//
//  UserWebService.swift
//  SilverTouch
//
//  Created by Divyesh  on 29/04/24.
//

import Foundation

class UserWebService : NSObject{
    
    
    func getUsers(block : ([UserModel]) -> Swift.Void){
        var response : [UserModel] = []
        let dict = readJsonFile(ofName: "StudentList")
        if let arr = dict["students"] as? [[String : Any]]{
            response = arr.map({UserModel(fromDictionary: $0)})
        }
        block(response)
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
