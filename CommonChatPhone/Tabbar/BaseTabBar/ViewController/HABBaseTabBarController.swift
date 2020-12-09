//
//  HABBaseTabBarController.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2020/12/7.
//

import UIKit
import SwiftTheme

@available(iOS 13.0, *)
class HABBaseTabBarController: UITabBarController {
    private var lastSelectNav = HABBaseNavigationController()
    
//    MARK: -生命周期
    private var indexFlag : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        initializes()
        p_setUpUI()
        setupChildVC()
        self.delegate = self;
    }
    private func initializes() {
        let tabBar = UITabBar.appearance()
        tabBar.isTranslucent = false
        
//
//        tabBar.theme_barTintColor = "Global.tabBarBgColor"
//        tabBar.theme_backgroundColor = "Global.tabBarBgColor"
        tabBar.barTintColor = UIColor.colorWithHexStr("01040D")
        tabBar.backgroundColor = UIColor.hexColor_FFFFFF()
        let normalAttr = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10),NSAttributedString.Key.foregroundColor: UIColor.tabBarTitleNormalColor()]
        let selectedAttr = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10),NSAttributedString.Key.foregroundColor : UIColor.tabBarTitleSelectColor()]
        let appearance = UITabBarAppearance()
        let par = NSMutableParagraphStyle.init()
        par.alignment = .center
        
        let normal = appearance.stackedLayoutAppearance.normal
        normal.titleTextAttributes = normalAttr
        
        let selected = appearance.stackedLayoutAppearance.selected
        selected.titleTextAttributes = selectedAttr
        self.tabBar.standardAppearance = appearance
    }
    private func p_setUpUI() {
        
    }
    //    MARK: - 创建子tabBar
    private func setupChildVC() {
//        首页
        let meetingVC = HABMarketViewController()
//        交易
        let transactionVC = HABTransactionHabCoinViewController()
//        契约
        let contractVC = HABContractViewController()
        //        我的
        let userCenter = HABMyHaoBoViewController()
        
        
        createChildController(meetingVC, title: "市场", image: UIImage.init(systemName: "waveform.path.ecg.rectangle"), selectedImage: UIImage.init(systemName: "waveform.path.ecg.rectangle.fill"))
        createChildController(transactionVC, title: "交易", image: UIImage.init(systemName: "lifepreserver"), selectedImage:UIImage.init(systemName: "lifepreserver.fill"))
        createChildController(contractVC, title: "契约", image: UIImage.init(systemName: "flame"), selectedImage: UIImage.init(systemName: "flame.fill"))
        createChildController(userCenter, title: "资产", image: UIImage.init(systemName: "person.circle"), selectedImage: UIImage.init(systemName: "person.circle.fill"))
    }
    /// 为tababr点击添加动画
    /// - Parameters:
    ///   - tabbar: tabbar
    ///   - item: tabbar菜单
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if let index = tabBar.items?.firstIndex(of: item) {
            
            if indexFlag != index {
                
                animateWithIndex(index: index)
            }
            
        }
        
    }
    

}


@available(iOS 13.0, *)
extension HABBaseTabBarController {
    private func createChildController(_ vc: UIViewController?,title: String,image: UIImage? = UIImage(),selectedImage : UIImage? = UIImage()) {
        if let rootVC = vc {
//            设置标题
            rootVC.title = title
//            默认状态
            rootVC.tabBarItem.image = UIImage.imageWithRenderingMode(image)

//            高亮状态
            rootVC.tabBarItem.selectedImage = UIImage.imageWithRenderingMode(selectedImage)
            
//            nav
            let nav = HABBaseNavigationController(rootViewController: rootVC)
            addChild(nav)
        }
    }
    /// 实现点击选中缩放动画
    private func animateWithIndex(index: Int) {
        var buttons = [UIView]()
        for view in tabBar.subviews {
            if view.isKind(of: NSClassFromString("UITabBarButton")!) {
                buttons.append(view)
            }
        }
        
        // 缩放动画
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pulse.duration = 0.15
        pulse.repeatCount = 1
        pulse.autoreverses = true
        pulse.fromValue = NSNumber(value: 0.7)
        pulse.toValue = NSNumber(value: 1.1)
        buttons[index].layer.add(pulse, forKey: nil)
        
        indexFlag = index
    }
}
@available(iOS 13.0, *)
extension HABBaseTabBarController : UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}

