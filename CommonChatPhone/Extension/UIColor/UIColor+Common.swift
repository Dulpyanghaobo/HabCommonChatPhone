//
//  UIColor+Common.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2020/12/8.
//

import UIKit
extension UIColor {
    //    MARK: - 常见控件UIColor
    class func appThemeHexColor() -> UIColor {
        return colorWithHexStr("1FB922")
    }
    // MARK:- 灰色背景色
    /// f7f7f7
    ///
    /// - Returns: f7f7f7
    class func backGroundGrayColor() ->UIColor {
        
        return colorWithHexStr("f7f7f7")
    }
    // MARK:- 按钮不可点击时标题颜色
    class func btnDisableTitleColor() ->UIColor {
        
        return colorWithHexStr("A6A6A6")
    }
    
    // MARK:- 应用常用黑色字体颜色
    class func textDrakHexColor() -> UIColor {
        
        return colorWithHexStr("151515")
    }
    
    // MARK:- 应用常用黑色字体颜色
    /// 1B1B1F
    ///
    /// - Returns: 1B1B1F
    class func textPrimaryColor() -> UIColor {
        
        return colorWithHexStr("1B1B1F")
    }
    
    // MARK:- 应用常用绿色字体颜色
    /// 26D747
    ///
    /// - Returns: 26D747
    class func textGreenColor() -> UIColor {
     
        return colorWithHexStr("26D747")
    }
    // MARK:- 分割线常用色
    
    class func boardLineColor() -> UIColor {
        
        return colorWithHexStr("D8D8D8")
    }
    
    // MARK:- 开关的常用颜色
    class func switchCurrencyColor() -> UIColor {
        
        return colorWithHexStr("fbb65e")
    }
    
    // MARK:- 常用按钮颜色
    class func buttonCurrencyColor() -> UIColor {
        
        return self.colorWithHexStr("FEE800")
    }
    
    // MARK:- 导航栏背景颜色
    class func navigationBarColor() -> UIColor {
        
        return self.colorWithHexStr("04030D")
    }
    
    // MARK:- HUD的背景颜色
    class func hudBackgroundColor() -> UIColor {
        //return self.colorWithHexStr("000000", alpha: 0.4)
        return UIColor.black.withAlphaComponent(0.7)
    }
    
    // MARK:- tabBar标题未选中颜色
    class func tabBarTitleNormalColor() -> UIColor {
        
        return colorWithHexStr("AAAAAA")
    }
    
    // MARK:- tabBar标题已选中颜色
    class func tabBarTitleSelectColor() -> UIColor {
        
        return colorWithHexStr("1FB922")
    }
    class func hexColor_FFFFFF() -> UIColor {
        return colorWithHexStr("FFFFFF")
    }
    class func hexColor_F5F5F5() -> UIColor {
        return colorWithHexStr("F5F5F5")
    }
    class func hexColor_333333() -> UIColor {
        return colorWithHexStr("333333")
    }
    class func hexColor_666666() -> UIColor {
        return colorWithHexStr("666666")
    }
    class func hexColor_999999() -> UIColor {
        return colorWithHexStr("999999")
    }
    class func hexColor_FFA500() -> UIColor {
        return colorWithHexStr("FFA500")
    }
    class func hexColor_90EE90() -> UIColor {
        return colorWithHexStr("90EE90")
    }
    class func hexColor_7CFC00() -> UIColor {
        return colorWithHexStr("7CFC00")
    }
    class func hexColor_0000CD() -> UIColor {
        return colorWithHexStr("0000CD")
    }
    class func hexColor_28A751() -> UIColor {
        return colorWithHexStr("28A751")
    }
}
