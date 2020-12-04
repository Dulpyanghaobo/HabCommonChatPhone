//
//  ArticleModel.swift
//  CommonChatPhone
//
//  Created by yhb on 2020/12/4.
//

import Foundation
// 定义模型名称
struct HABArticle: Codable {
    var content: String
    var created_by: String
    var created_on: String
    var desc: String
    var modified_by: String
    var modified_on: String
    var state: Int
    var tag_id : String
    var title : String

}

