//
//  SectionModel.swift
//  SilverTouch
//
//  Created by Divyesh  on 17/04/24.
//

import Foundation


class SectionModel : NSObject{
    var section: String!
    var members: [PeopleModel]!
    
    init(fromDictionary dict : [String:Any]){
        section = dict["section"] as? String
        members = dict["members"] as? [PeopleModel]
    }
}
