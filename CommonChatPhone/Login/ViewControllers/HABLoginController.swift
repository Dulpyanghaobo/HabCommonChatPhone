//
//  HABLoginController.swift
//  CommonChatPhone
//
//  Created by yhb on 2020/12/4.
//

import UIKit
import Alamofire
import SwiftyJSON
struct Login: Encodable {
    let username: String
    let password: String
    var token : String
}
@available(iOS 13.0, *)
class HABLoginController: UIViewController {

    private let headView : HABLoginRegsiterInputView = {
        let headView = HABLoginRegsiterInputView()
        headView.callBackBlock { (email,password) in
            var tokenStr : String = ""
            var login = Login(username: email, password: password, token: tokenStr)
            AF.request("http://127.0.0.1:8000/auth?username=\(email)&password=\(password)",method: .get,parameters: nil).responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    if let responseJSON = value as? [String: Any] {
                        let tokenDic = responseJSON["data"] as? Dictionary<String,Any>
                        if let token = tokenDic!["token"] as? String{
                            login.token = token
                            AF.request("http://127.0.0.1:8000/api/v1/articles?token=\(login.token)",method: .get,parameters: nil).responseJSON { (response) in
                                switch response.result {
                                case .success(let value):
                                    if let responseData = value as? [String : Any] {
                                        print("\(responseData)")
                                        let dataDic = responseData["list"] as? Dictionary<String,Any>
                                        print(dataDic)
                                        let jsonData = try? JSONSerialization.data(withJSONObject: responseData, options: [])
                                        let article = try? JSONDecoder().decode(HABArticle.self, from: jsonData!)
                                        
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
            p_setUpUI()
        }
    func p_setUpUI() {
        view.addSubview(headView)
        headView.snp.makeConstraints{(make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0))
        }
    }
}


