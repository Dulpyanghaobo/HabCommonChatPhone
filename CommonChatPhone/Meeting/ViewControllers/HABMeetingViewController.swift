//
//  HABMeetingViewController.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2020/12/8.
//

import UIKit
@available(iOS 13.0, *)
class HABMeetingViewController: UIViewController,HideNavigationBarProtocol {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (HABUserManager.shared.userInfo?.token.isEmpty == true) {
            let login = HABLoginController()
            self.navigationController?.pushViewController(login, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .hexColor_FFFFFF()
    }

}
