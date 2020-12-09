//
//  HABMainNavViewController.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2020/12/9.
//

import UIKit

@available(iOS 13.0, *)
class HABMainNavViewController: UIViewController {
    //    MARK: - 属性
//    风险评估按钮
    private let leftButton : UIButton = {
        let button = UIButton()
        let bonjourSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 24, weight: .medium)

        button.setImage(UIImage.init(systemName: "bonjour",withConfiguration: bonjourSymbolConfiguration), for: .normal)
        button.addTarget(self, action: #selector(didLeftTapLogin), for: .touchUpInside)
        return button
    } ()
//    送礼按钮
    private let rightButton : UIButton = {
        let button = UIButton()
        let giftSymbolConfiguration = UIImage.SymbolConfiguration(pointSize: 24, weight: .medium)
        button.setImage(UIImage.init(systemName: "gift",withConfiguration: giftSymbolConfiguration), for: .normal)
        button.addTarget(self, action: #selector(didRightTapLogin), for: .touchUpInside)
        return button
    } ()
    private let centerView : UIView = {
        let view = MainNavView()
        
        return view
    }()
    
    
    

        override func viewDidLoad() {
        super.viewDidLoad()
            centerView.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            centerView.addGestureRecognizer(tapGesture)
            p_setUpUI()
    }
        func p_setUpUI() {
            view.addSubview(centerView)
            view.addSubview(leftButton)
            view.addSubview(rightButton)
            p_addMasonry()
        }
        func p_addMasonry() {
            leftButton.snp.makeConstraints{(make) in
                make.left.equalToSuperview().offset(12)
                make.size.equalTo(CGSize(width: 32, height: 32))
                make.centerY.equalToSuperview().offset(0)
            }
            
            rightButton.snp.makeConstraints{(make) in
                make.right.equalToSuperview().offset(-12)
                make.centerY.equalToSuperview().offset(0)
                make.size.equalTo(CGSize(width: 32, height: 32))
            }
            
            centerView.snp.makeConstraints{(make) in
                make.center.equalToSuperview().offset(0)
                make.left.equalTo(leftButton.snp.right).offset(12)
                make.top.bottom.equalToSuperview().offset(0)
                make.right.equalTo(rightButton.snp.left).offset(-12)
            }


        }
        func p_setUpData() {
            
        }
    
    //    MARK: -event
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        UIView.animate(withDuration: 1) {
            self.centerView.transform = CGAffineTransform(a: 0.2, b: 0.8, c: 0.8, d: 0.2, tx: 1, ty: 1)
        }completion: { (finished) in
            if (finished) {
                UIView.animate(withDuration: 0.5) {
                    self.centerView.transform = .identity
                }
            }
        }
    }
    @objc func didLeftTapLogin() {
    }
    @objc func didRightTapLogin() {
    }
    }
