//
//  HABLoginController.swift
//  CommonChatPhone
//
//  Created by yhb on 2020/12/4.
//

import UIKit
import Alamofire
import SwiftyJSON
import Moya
import NSObject_Rx


@available(iOS 13.0, *)
class HABLoginController: UIViewController,HideNavigationBarProtocol{
    private var emailTextField : UITextField?
    private var passwordTextField : UITextField?
    private let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("登录", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return button
    } ()
    
    
    private let headView : HABLoginRegsiterInputView = {
        let headView = HABLoginRegsiterInputView()
        headView.callBackBlock { (email,password) in
            var tokenStr : String = ""
            var login = Login(username: email, password: password, token: tokenStr)
            
//            AF.request("http://127.0.0.1:8000/auth?username=\(email)&password=\(password)",method: .get,parameters: nil).responseJSON { (response) in
//                switch response.result {
//                case .success(let value):
//                    if let responseJSON = value as? [String: Any] {
//                        let tokenDic = responseJSON["data"] as? Dictionary<String,Any>
//                        if let token = tokenDic!["token"] as? String{
//                            login.token = token
//                            HABUserManager.shared.userInfo?.email = email
//                            HABUserManager.shared.userInfo?.password = password
//                            HABUserManager.shared.userInfo?.token = token
//                            print(login)
//                            //                            AF.request("\(NetworkInEnvHostApiV1)/articles?token=\(login.token)",method: .get,parameters: nil).responseJSON { (response) in
//                            //                                switch response.result {
//                            //                                case .success(let value):
//                            //                                    if let responseData = value as? [String : Any] {
//                            //                                        print("\(responseData)")
//                            //                                        let dataDic = responseData["data"] as? Dictionary<String,Any>
//                            //                                        if let lists = dataDic!["lists"] as? NSArray {
//                            //                                            for list in lists {
//                            //                                                let articlies = JSON(list)
//                            //                                                let model = Articles.init(jsonData: articlies)
//                            //                                                let meetDetailViewModel = HABMeetDetailViewModel(user: login, articles: model)
//                            //                                                let meetDetailVC = HABMeetDetailViewController()
//                            //                                                meetDetailVC.viewModel = meetDetailViewModel
//                            //
//                            //                                            }
//                            //
//                            //                                        }
//                            //
//                            //                                    }
//                            //                                case .failure(let error): break
//                            //                                }
//                            //                            }
//                        }
//                    }
//                case .failure(let error): break
//                }
//            }
            
        }
        return headView
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hexColor_FFFFFF()
        emailTextField = createTextField(placeholder: "输入邮件")
        passwordTextField = createTextField(placeholder: "输入密码")
        p_setUpUI()
        
    }
    func createTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.returnKeyType = .continue
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.placeholder = placeholder
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        textField.leftViewMode = .always
        textField.backgroundColor = .white
        return textField
    }
    func p_setUpUI() {
        view.addSubview(emailTextField!)
        view.addSubview(passwordTextField!)
        view.addSubview(loginButton)
        add_masonry()
    }
    func add_masonry() {
        emailTextField!.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(statusBarHeight+60)
            make.centerX.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(60)
        }
        passwordTextField!.snp.makeConstraints{(make) in
            make.top.equalTo(emailTextField!.snp.bottom).offset(20)
            make.centerX.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(60)
        }
        loginButton.snp.makeConstraints{(make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField!.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.height.equalTo(60)
        }
    }
    @objc private func didTapLogin() {
        emailTextField?.resignFirstResponder()
        passwordTextField?.resignFirstResponder()
        guard let email = emailTextField?.text,let password = passwordTextField?.text,!email.isEmpty,!password.isEmpty,password.count >= 6 else {
            return alertUserLoginError()
        }
        let authlogin = MultiTarget(LoginMoyaApi.auth(email, password))
        HttpRequestManager.rxRequest(authlogin,type: Login.self ).subscribe(onSuccess: {(list) in
            print("\(list)")
        }) { (Error) in
        
        }.disposed(by: rx.disposeBag)
        
    }
    func alertUserLoginError () {
        
    }
}

@available(iOS 13.0, *)
extension HABLoginController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField?.becomeFirstResponder()
        } else if textField == passwordTextField {
            didTapLogin()
        }
        return true
    }
}


