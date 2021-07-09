//
//  AppCommon.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2020/12/8.
//

import UIKit

@available(iOS 13.0, *)
//    MARK: -屏幕
//全屏大小
public let kScreen = UIScreen.main.bounds

//全屏宽
public let kScreenW = UIScreen.main.bounds.size.width

//全屏高
public let kScreenH = UIScreen.main.bounds.size.height

//导航栏高度
public let statusBarHeight = UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.size.height

//navigationBar高度
public let KNavigationBarHeight = statusBarHeight! + 44


//全屏显示五个cell的cell宽
public let fiveCellWidth = kScreenW / 5
//public let


//    MARK: - 回调
typealias SelectedCallBack = (_ obj : Any) ->Void

// MARK: -动画执行时间
let kDuration : TimeInterval = 3.0


//线上网络请求


// MARK:- 偏好设置存储
/// 应用是否首次启动
public let kAppLaunchUserDefaultsKey = "kAppLaunchUserDefaultsKey"
/// 应用当前语言设置
public let kAppLanguageUserDefaultsKey = "kAppLanguageUserDefaultsKey"
/// 用户基本信息
public let kUserInfoSaveUserDefaultsKey = "kUserInfoSaveUserDefaultsKey"
/// 用户名存储显示
public let kUserAccountSaveUserDefaultsKey = "kUserAccountSaveUserDefaultsKey"
/// 更换AppIcon
public let kChangedAppIocnUserDefaultsKey = "kChangedAppIocnUserDefaultsKey"
/// 白天夜间模式
public let kThemeSettingUserDefaultKey = "kThemeSettingUserDefaultKey"

// MARK: - FileManager Path
public let cachesURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
public let libraryURL = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)[0]

// MARK:- 当前窗口
let kCurrentWindow = UIApplication.shared.windows[0]
// 顶部的安全距离
let topPadding = kCurrentWindow.safeAreaInsets.top
// 底部的安全距离
let bottomPadding = kCurrentWindow.safeAreaInsets.bottom

// MARK:- 自定义打印日志
func printLog<T>(_ message: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line){
    //文件名、方法、行号、打印信息
    #if DEBUG
    print("方法:\(methodName)\n行号:\(lineNumber)\n打印信息:\(message)");
    #endif
}


// MARK:- 系统信息相关
let infoDictionary = Bundle.main.infoDictionary!
/// 程序名称
let appDisplayName = infoDictionary["CFBundleDisplayName"] as! String
/// 主程序版本号
let majorVersion = infoDictionary["CFBundleShortVersionString"] as! String //主程序版本号

/// 设备唯一标识码
public let kDeviceUUID = { () -> String in
    if let uuid = UIDevice.current.identifierForVendor?.uuidString {
        return uuid
    }
    return ""
}
