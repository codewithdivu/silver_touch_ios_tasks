//
//  NewsModel.swift
//  SilverTouch
//
//  Created by Divyesh  on 01/05/24.
//

import Foundation

class NewsModel: NSObject {
    var id: Int
    var category: String
    var heading: String
    var readAgo: String
    var date: String
    var time: String
    var content: String
    var imgUrl: String
    var isBookmarked: Bool
    
    init(dict: [String: Any]) {
        self.id = dict["id"] as? Int ?? 0
        self.category = dict["category"] as? String ?? ""
        self.heading = dict["heading"] as? String ?? ""
        self.readAgo = dict["readAgo"] as? String ?? ""
        self.date = dict["date"] as? String ?? ""
        self.time = dict["time"] as? String ?? ""
        self.content = dict["content"] as? String ?? ""
        self.imgUrl = dict["imgUrl"] as? String ?? ""
        self.isBookmarked = dict["isBookmarked"] as? Bool ?? false
    }
}

