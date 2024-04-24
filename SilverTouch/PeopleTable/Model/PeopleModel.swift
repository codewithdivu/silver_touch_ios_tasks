//
//  PeopleModel.swift
//  SilverTouch
//
//  Created by Divyesh  on 17/04/24.
//

import Foundation

class PeopleModel : NSObject{
    var name: String!
    var dob: String!
    var department: String!
    var img: String!
    
    init(fromDictionary dict : [String : Any]){
        name = dict["name"] as? String
        dob  = dict["dob"] as? String
        department = dict["department"] as? String
//        img = dict["img"] as? String
    }
}
