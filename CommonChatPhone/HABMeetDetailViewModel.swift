//
//  HABMeetDetailViewModel.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2020/12/7.
//

import UIKit

class HABMeetDetailViewModel: NSObject {
    let articles : Articles

    let user : Login
    init(user:Login,articles:Articles) {
        self.articles = articles
        self.user = user
    }
}
