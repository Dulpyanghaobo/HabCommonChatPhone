//
//  HABLoginController.swift
//  CommonChatPhone
//
//  Created by yhb on 2020/12/4.
//

import UIKit
import Alamofire
import SwiftyJSON
@available(iOS 13.0, *)
class HABLoginController: UIViewController {
    
    private let headView : HABLoginRegsiterInputView = {
        let headView = HABLoginRegsiterInputView()
        headView.callBackBlock { (email,password) in
            var tokenStr : String = ""
            var login = Login(username: email, password: password, token: tokenStr)
            AF.request("\(NetworkInEnvHost)/auth?username=\(email)&password=\(password)",method: .get,parameters: nil).responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    if let responseJSON = value as? [String: Any] {
                        let tokenDic = responseJSON["data"] as? Dictionary<String,Any>
                        if let token = tokenDic!["token"] as? String{
                            login.token = token
                            print(login)
                            AF.request("\(NetworkInEnvHostApiV1)/articles?token=\(login.token)",method: .get,parameters: nil).responseJSON { (response) in
                                switch response.result {
                                case .success(let value):
                                    if let responseData = value as? [String : Any] {
                                        print("\(responseData)")
                                        let dataDic = responseData["data"] as? Dictionary<String,Any>
                                        if let lists = dataDic!["lists"] as? NSArray {
                                            for list in lists {
                                                let articlies = JSON(list)
                                                let model = Articles.init(jsonData: articlies)
                                                let meetDetailViewModel = HABMeetDetailViewModel(user: login, articles: model)
                                                let meetDetailVC = HABMeetDetailViewController()
                                                meetDetailVC.viewModel = meetDetailViewModel
                                                
                                            }

                                        }
                                        
                                    }
                                case .failure(let error): break
                                }
                            }
                        }
                    }
                case .failure(let error): break
            }
            }

    }
        return headView

    }()
        override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "登录"
            self.navigationController?.title = "demo"
            p_setUpUI()
        }
    func p_setUpUI() {
        view.addSubview(headView)
        headView.snp.makeConstraints{(make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0))
        }
    }
}


