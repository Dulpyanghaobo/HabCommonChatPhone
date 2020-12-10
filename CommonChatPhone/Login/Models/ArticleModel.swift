//
//  ArticleModel.swift
//  CommonChatPhone
//
//  Created by yhb on 2020/12/4.
//

import Foundation
import SwiftyJSON
import RxSwift
// 定义模型名称
struct LoginData: Codable {
    let data : Login
    let code : Int
    let msg : String
}
struct Login: Codable {
    let username: String
    let password: String
    var token : String
}
struct Tag : Encodable {
    let created_by : String
    let created_on : String
    let modified_by : String
    let modified_on : String
    let name : String
    let state : Int
    init(jsonData:JSON) {
        created_by = jsonData["created_by"].stringValue
        created_on = jsonData["created_on"].stringValue
        modified_by = jsonData["modified_by"].stringValue
        modified_on = jsonData["modified_on"].stringValue
        name = jsonData["name"].stringValue
        state = jsonData["state"].intValue

    }
}
struct Articles: Encodable {
    let content: String
    let created_by: String
    let created_on : String
    let desc : String
    let modified_by : String
    let modified_on : String
    let state : Int
    let tag_id : Int
    let title : String
    let tag : Tag
    init(jsonData: JSON) {
        content = jsonData["content"].stringValue
        created_by = jsonData["created_by"].stringValue
        created_on = jsonData["created_on"].stringValue
        desc = jsonData["desc"].stringValue
        modified_by = jsonData["modified_by"].stringValue
        modified_on = jsonData["modified_on"].stringValue
        state = jsonData["state"].intValue
        tag_id = jsonData["tag_id"].intValue
        title = jsonData["title"].stringValue
        tag = Tag(jsonData:jsonData["tag"])
        
    }
}

