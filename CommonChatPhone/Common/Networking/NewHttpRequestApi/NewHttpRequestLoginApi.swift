//
//  NewHttpRequestLoginApi.swift
//  CommonChatPhone
//
//  Created by yhb on 2020/12/8.
//

import Foundation
import Moya
import SwiftyJSON
//创建登录请求
enum LoginMoyaApi {
    case auth(String,String)
}
extension LoginMoyaApi : TargetType {
    var baseURL: URL {
        return URL.init(string: "http://127.0.0.1:8000")!
    }
    var path: String {
        switch self {
        case .auth(_,_):
            return "/auth"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .auth:
            return .get
        }
    }
    
    //这个就是做单元测试模拟的数据，只会在单元测试文件中有作用
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    var task: Task {
        switch self {
        case .auth(let username,let password):
            var params:[String : Any] = [:]
            params["username"] = username
            params["password"] = password
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        default:
            return .requestPlain
        }

    }
    
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }

}
