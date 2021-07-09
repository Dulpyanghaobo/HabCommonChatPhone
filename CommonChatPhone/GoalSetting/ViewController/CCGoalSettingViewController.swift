//
//  CCGoalSettingViewController.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2021/7/10.
//

import UIKit

/// 进行信息填写并且引导用户目标
class CCGoalSettingViewController: NiblessViewController,HideNavigationBarProtocol {

    fileprivate let firstSchduleView : CCGoalSettingFirstSchduleView = {
        let view = CCGoalSettingFirstSchduleView()
        view.backgroundColor = .hexColor_FFFFFF()
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        /// 导航栏消失
        view.addSubview(firstSchduleView)
        firstSchduleView.snp.makeConstraints{(make) in
            make.edges.equalToSuperview().offset(0)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)

    }
}
