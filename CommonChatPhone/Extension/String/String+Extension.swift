//
//  String+Extension.swift
//  CommonChatPhone
//
//  Created by yhb on 2020/12/8.
//

import Foundation

extension String {
    /// 字典转成JSON字符串
    ///
    /// - Parameter dictionary: 字典
    /// - Returns: 转成后的字符串
    func getJSONStringFromDictionary(_ dictionary: NSDictionary) -> String {
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData
        let JSONString = NSString(data:data as Data, encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
    }
    /// JSON字符串转字典
    ///
    /// - Parameter jsonString: json字符串
    /// - Returns: 转成后的字典
    func getDictionaryFromJSONString(_ jsonString: String) ->NSDictionary {
        let jsonData:Data = jsonString.data(using: .utf8)!
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
    }
}


