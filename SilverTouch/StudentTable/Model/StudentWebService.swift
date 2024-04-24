//
//  StudentWebService.swift
//  SilverTouch
//
//  Created by Divyesh  on 17/04/24.
//

import Foundation

class StudentWebService : NSObject{
    
    
    func getStudents(block : ([StudentModel]) -> Swift.Void){
        var response : [StudentModel] = []
        let dict = readJsonFile(ofName: "StudentList")
        if let arr = dict["students"] as? [[String : Any]]{
            response = arr.map({StudentModel(fromDictionary: $0)})
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
