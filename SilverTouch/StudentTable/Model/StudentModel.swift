//
//  StudentModel.swift
//  SilverTouch
//
//  Created by Divyesh  on 17/04/24.
//

import Foundation

class StudentModel : NSObject{
    var name:String!
    var dob:String!
    var department:String!
    
    init(fromDictionary dictionary : [String : Any]){
        name = dictionary["name"] as? String
        dob = dictionary["dob"] as? String
        department = dictionary["department"] as? String
    }
}
