//
//  ErrorResponse.swift
//  CommonChatPhone
//
//  Created by yhb on 2020/12/8.
//

import Foundation
import HandyJSON


enum ErrorResponseType{
    case System
    case Logic
}

struct ErrorResponse: HandyJSON {

    // 系统错误
    var timestamp: String?
    var status: String?
    var error: String?
    var message: String?
    var path: String?
    
    // 逻辑错误
    var code: String?
    var msg: String?
    var alertMsg: String?

    var type: ErrorResponseType?
    var data: Data?
}



