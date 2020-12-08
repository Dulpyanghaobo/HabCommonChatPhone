//
//  HABUserManager.swift
//  CommonChatPhone
//
//  Created by yhb on 2020/12/8.
//

import Foundation
import KakaJSON
import Moya
import SwiftyJSON
import CryptoSwift


private let USER_AES_KEY = "hab.coin.ios"

class HABUserManager: NSObject {
    static let shared = HABUserManager()
    
//    是否设置支付密码
    var isPaySeted: Bool = false
//    缓存用户信息
    func cacheUserInfo(_ userInfo:[String: Any]?) {
        guard !((userInfo?.isEmpty)!) else {
            return
        }
//        存储信息
        // 存储信息
        kakaJSONWithDictionary(userInfo!)
    }
    
//    清除用户信息缓存
    func clearChaches() {
        UserDefaults.standard.removeObject(forKey: kUserInfoSaveUserDefaultsKey)
        UserDefaults.standard.removeObject(forKey: kUserAccountSaveUserDefaultsKey)
        UserDefaults.standard.synchronize()
    }
    
    /// (中心化)用户数据模型
    var userInfo: HABUserInfo? {
        get {
            if let encryptedBase64: String = UserDefaults.standard.value(forKey: kUserInfoSaveUserDefaultsKey) as? String {
                do {
                    let aes = try AES(key: Padding.zeroPadding.add(to: USER_AES_KEY.bytes, blockSize: AES.blockSize),
                                      blockMode: ECB())
                    //开始解密（从加密后的base64字符串解密）
                    let decrypted = try encryptedBase64.decryptBase64ToString(cipher: aes)
                    //字符串转成字典
                    let dictionary = String().getDictionaryFromJSONString(decrypted)
                    //转成模型
                    if let result = dictionary.kj.model(HABUserInfo.self) {
                        return result
                    }
                }catch {
                    printLog(error.localizedDescription)
                }
            }
            
            return HABUserInfo()
        }
    }
    
//    用户登录
    var isEnter: Bool? {
        get {
            guard ((self.userInfo?.token == nil)) else {
                return false
            }
            return true
        }
    }
    
    // 字典null值处理
    private func kakaJSONWithDictionary(_ dictionary : [String:Any]) {
        var object = JSON(dictionary).dictionaryObject
        for (key,value) in object! {
            if (value is NSNull) {
                object?.updateValue("", forKey: key)
            }
        }
        encryptionToAES(String().getJSONStringFromDictionary(object! as NSDictionary))
    }
    required override init() {
        super.init()
    }
}

extension HABUserManager {
    func encryptionToAES(_ JSONString: String) {
        guard !(JSONString.isEmpty) else {
            return
        }
        
        do {
            //使用AES-128-ECB加密模式
            let aes = try AES(key: Padding.zeroPadding.add(to: USER_AES_KEY.bytes, blockSize: AES.blockSize),
                              blockMode: ECB())
            let encrypted = try aes.encrypt(JSONString.bytes)
            //将加密结果转成base64形式
            if let encryptedBase64 = encrypted.toBase64() {
                UserDefaults.standard.set(encryptedBase64, forKey: kUserInfoSaveUserDefaultsKey)
                UserDefaults.standard.synchronize()
            }
        }catch {
            
            printLog(error.localizedDescription)
        }
    }
}
