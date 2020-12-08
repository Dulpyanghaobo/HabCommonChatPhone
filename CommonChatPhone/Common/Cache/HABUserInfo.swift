//
//  HABUserInfo.swift
//  CommonChatPhone
//
//  Created by yhb on 2020/12/8.
//
// MARK: -用户数据模型
import UIKit
import KakaJSON

class HABUserInfo: Convertible,Codable {
    var id : Int?
    var name : String = ""
    var fromLp : Bool = false//是否是老用户
    var changeStatus : Bool = false //用户状态
    var password : String = "123456"//密码
    var uid : String = ""
    var token : String = ""
    var username : String = ""//用户名
    var fullname : String = ""//全名
    var email : String = ""//邮件
    var mobilePhone : String = ""//手机号
    var countryCode : String = ""//地区
    var userImageUrl : String = ""//用户头像
    required init() {}
}
