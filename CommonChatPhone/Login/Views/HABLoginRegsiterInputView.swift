//
//  HABLoginRegsiterInputView.swift
//  CommonChatPhone
//
//  Created by yhb on 2020/12/4.
//

import UIKit

@available(iOS 13.0, *)
class HABLoginRegsiterInputView: UIView {

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
    
    typealias tapBlock = (_ email:String,_ passwd:String) -> Void
    var callBack : tapBlock?
    public func callBackBlock(block: @escaping tapBlock) {
           callBack = block
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        emailTextField = createTextField(placeholder: "输入邮件")
        passwordTextField = createTextField(placeholder: "输入密码")
        P_setUpUI()
    }
    required init?(coder: NSCoder) {
        fatalError("无法加载")
    }
    
    @objc private func didTapLogin() {
        emailTextField?.resignFirstResponder()
        passwordTextField?.resignFirstResponder()
        guard let email = emailTextField?.text,let password = passwordTextField?.text,!email.isEmpty,!password.isEmpty,password.count >= 6 else {
            return alertUserLoginError()
        }
        if callBack != nil {
            callBack!(email,password)
        }
//        let vc = HABMeetDetailViewController()
//        vc.view.backgroundColor = .white
//        navigationController?.pushViewController(vc, animated: true)
    }
    func P_setUpUI() {
        addSubview(emailTextField!)
        addSubview(passwordTextField!)
        addSubview(loginButton)
        add_masonry()
    }
    func add_masonry() {
        emailTextField!.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(0)
            make.centerX.equalToSuperview().offset(0)
                                make.left.equalToSuperview().offset(30)
                                make.right.equalToSuperview().offset(-30)
                                make.height.equalTo(60)
        }
        passwordTextField!.snp.makeConstraints{(make) in
            make.top.equalTo(emailTextField!.snp.bottom).offset(0)
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
//        emailField.snp.makeConstraints{(make) in
//                    make.top.equalTo(imageView.snp.bottom).offset(20)
//                    make.centerX.equalTo(view)
//                    make.left.equalTo(view).offset(30)
//                    make.right.equalTo(view).offset(-30)
//                    make.height.equalTo(60)
//                }
//                passwordFiled.snp.makeConstraints{(make) in
//                    make.centerX.equalToSuperview()
//                    make.top.equalTo(emailField.snp.bottom).offset(10)
//                    make.left.equalToSuperview().offset(30)
//                    make.right.equalToSuperview().offset(-30)
//                    make.height.equalTo(60)
//                }
//                loginButton.snp.makeConstraints{(make) in
//                    make.centerX.equalToSuperview()
//                    make.top.equalTo(passwordFiled.snp.bottom).offset(30)
//                    make.left.equalToSuperview().offset(50)
//                    make.right.equalToSuperview().offset(-50)
//                    make.height.equalTo(60)
//                }
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
    func alertUserLoginError () {

    }
}
@available(iOS 13.0, *)
extension HABLoginRegsiterInputView : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField?.becomeFirstResponder()
        } else if textField == passwordTextField {
            didTapLogin()
        }
        return true
    }
}
