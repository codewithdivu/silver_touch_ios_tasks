//
//  PersonModel.swift
//  SilverTouch
//
//  Created by Divyesh  on 22/04/24.
//


import Foundation

class PersonModel : NSObject{
    var name: String!
    var img: String!
    
    init(fromDictionary dict : [String : Any]){
        name = dict["name"] as? String
        img = dict["img"] as? String
    }
}
