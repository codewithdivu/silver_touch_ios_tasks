//
//  SideMenuModel.swift
//  SilverTouch
//
//  Created by Divyesh  on 23/04/24.
//

import Foundation

class SideMenuModel : NSObject {
    var TitleKey:String
    let storyboardID:String
    let Image:String
    let ControllerName:String
    var expanded : Bool
   
enum keys: String {
case TitleKey
    case storyboardID
    case Image
    case expanded
    case ControllerName
    
}
    init(dict : [String:Any]){
        self.TitleKey = dict[keys.TitleKey.rawValue] as? String ?? ""
        self.storyboardID = dict[keys.storyboardID.rawValue] as? String ?? ""
        self.Image = dict[keys.Image.rawValue] as? String ?? ""
        self.expanded = false
        self.ControllerName = dict[keys.ControllerName.rawValue] as? String ?? ""
    }
}
