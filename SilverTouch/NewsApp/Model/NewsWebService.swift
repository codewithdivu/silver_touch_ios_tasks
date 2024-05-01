//
//  NewsWebService.swift
//  SilverTouch
//
//  Created by Divyesh  on 01/05/24.
//

import Foundation

class NewsWebService : NSObject{
    
    
    func getNews(block : ([NewsModel]) -> Swift.Void){
        var response : [NewsModel] = []
        let dict = readJsonFile(ofName: "news")
        if let arr = dict["news"] as? [[String : Any]]{
            response = arr.map({NewsModel(dict: $0)})
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
