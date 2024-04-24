//
//  TodoModel.swift
//  SilverTouch
//
//  Created by Divyesh  on 22/04/24.
//

import Foundation

class TodoModel : NSObject {
    var title : String!
    var isShow : Bool!
 
    
    init(fromDictionary dictionary : [String : Any]){
        title = dictionary["title"] as? String
        isShow = dictionary["isShow"] as? Bool
    }
}
