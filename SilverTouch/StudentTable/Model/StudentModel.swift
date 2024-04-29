//
//  StudentModel.swift
//  SilverTouch
//
//  Created by Divyesh  on 17/04/24.
//

import Foundation

class StudentModel : NSObject{
    var id : Int!
    var name : String!
    var department : String!
    var studentId : Int!
    var sportsName : String!
    var dob : String!
    var gender : String!
    var grades : Array<Int>!
    var address : String!
    
    init(fromDictionary dictionary : [String : Any]){
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        department = dictionary["department"] as? String
        studentId = dictionary["studentId"] as? Int
        sportsName = dictionary["sportsName"] as? String
        dob = dictionary["dob"] as? String
        gender = dictionary["gender"] as? String
        address = dictionary["address"] as? String
        grades = dictionary["grades"] as? Array
    }
}
