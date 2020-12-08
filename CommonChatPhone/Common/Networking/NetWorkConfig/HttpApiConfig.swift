//
//  HttpApiConfig.swift
//  CommonChatPhone
//
//  Created by yhb on 2020/12/8.
//

import Foundation

/// 主要业务模块功能
let HttpApiConfig : HttpApiConfigType = .Test


/// 请求接口基于环境配置
///
/// - Test: 测试环境
/// - Develop: 正式测试环境
/// - Product: 正式生产环境
enum HttpApiConfigType {
    case Test
    case Develop
    case Product
}

extension HttpApiConfigType {
    
    var baseURL : String {
        switch self {
        case .Test:
            return "http://127.0.0.1:8000"
        case .Develop:
            return "https://stage.api.sblock.com"
        case .Product:
            return "https://api.sblock.com"
        }
    }
    
    var webBaseURL : String {
        switch self {
        case .Test:
            return "http://127.0.0.1:8000/"
        case .Develop:
            return "https://stage.sblock.com/"
        case .Product:
            return "https://appsview.sblock.com/"
        }
    }
    
    /// 腾讯Bugly
    var buglyId : String {
        switch self {
        case .Test:
            return "64862b9996"
        case .Product:
            return "c4504303b1"
        case .Develop:
            return "64862b9996"
        }
    }
    
    /// 切换配置的工作
    func changeEnv() { }
    
}
