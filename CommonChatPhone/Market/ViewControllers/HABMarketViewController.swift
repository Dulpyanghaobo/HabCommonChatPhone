//
//  HABMeetingViewController.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2020/12/8.
//

import UIKit
@available(iOS 13.0, *)
class HABMarketViewController: UIViewController,HideNavigationBarProtocol {
    
//    导航栏
    private let mainNavViewController : UIViewController = {
        let habNAVVC = HABMainNavViewController()
        return habNAVVC
    } ()

//    imageLabel
    private let imageLabelView : HABMainImageLabelView = {
        let view = HABMainImageLabelView()
        
        return view
    } ()
    
    static func getCurrentVC()->UIViewController{
        
        var window = UIApplication.shared.keyWindow
        if window?.windowLevel != UIWindow.Level.normal{
            let windows = UIApplication.shared.windows
            for  tempwin in windows{
                if tempwin.windowLevel == UIWindow.Level.normal{
                    window = tempwin
                    break
                }
            }
        }
        let frontView = (window?.subviews)![0]
        let nextResponder = frontView.next
        if nextResponder?.isKind(of: UIViewController.classForCoder()) == true{

            return nextResponder as! UIViewController
        }else if nextResponder?.isKind(of: UINavigationController.classForCoder()) == true{

            return (nextResponder as! UINavigationController).visibleViewController!
        }
        else {

            if (window?.rootViewController) is UINavigationController{
              return ((window?.rootViewController) as! UINavigationController).visibleViewController!//只有这个是显示的controller 是可以的必须有nav才行
            }
            
           return (window?.rootViewController)!
            
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (HABUserManager.shared.userInfo?.token.isEmpty == true) {
            let login = HABLoginController()
            self.navigationController?.pushViewController(login, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        p_setUpUI()
        let vc = HABHelpPamphletViewController()
        vc.view.backgroundColor = UIColor.hexColor_FFFFFF()
        
        imageLabelView.callBackBlock {[weak self] (obj) in
        
            self?.navigationController?.pushViewController(vc, animated: false)
        }
        view.backgroundColor = .hexColor_FFFFFF()
    }
    func p_setUpUI() {
        view.addSubview(mainNavViewController.view)
        view.addSubview(imageLabelView)
        p_addMasonry()
    }
    func p_addMasonry() {
        mainNavViewController.view.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(statusBarHeight)
            make.left.right.equalToSuperview().offset(0)
            make.height.equalTo(44)
        }
       imageLabelView.snp.makeConstraints{(make) in
        make.top.equalTo(mainNavViewController.view.snp.bottom)
        make.left.right.equalToSuperview().offset(0)
        make.height.equalTo(77)
        }
    }
    func p_setUpData() {
        
    }
    func clickAction(obj: Any) {
//        super.navigationController
    }

}
