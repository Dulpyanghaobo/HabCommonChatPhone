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
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        let nav = se
    }
//    imageLabel
    private let imageLabelView : UIView = {
        let view = HABMainImageLabelView()
        view.callBackBlock { (obj) in
            if obj is Int {
                let vc = HABMarketViewController()
                vc.clickAction(obj: obj)
//                    .navigationController?.pushViewController(, animated: true)
            }
        }
        return view
    } ()
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
        let vc = HABHelpPamphletViewController()

    }

}
