//
//  MainNavView.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2020/12/9.
//

import UIKit

@available(iOS 13.0, *)
class MainNavView: UIView {
    
    private let lab : UILabel = {
        let lab = UILabel()
        lab.text = "你好,\(HABUserManager.shared.userInfo?.username ?? "投资人")"
        lab.textAlignment = .right
        lab.numberOfLines = 1
        lab.font = .boldSystemFont(ofSize: 24)
        return lab
    }()
    
//    创建button
    private let button : UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(systemName: "sparkle"), for: .normal)
        button.backgroundColor = .clear
        return button
    } ()

//    初始化
    override init(frame: CGRect) {
        super.init(frame: frame)
        p_setUpUI()
        
    }
    func p_setUpUI () {
        addSubview(lab)
        addSubview(button)
        add_Snp()
    }
    
    func add_Snp() {
        let widthOffset = "你好,\(HABUserManager.shared.userInfo?.username ?? "投资人")".ga_widthForComment(fontSize: 24)
        button.snp.makeConstraints{(make) in
            make.top.bottom.equalToSuperview().offset(0)
            make.height.equalTo(22)
            make.centerX.equalToSuperview().offset(-widthOffset/2)
            
        }
        
        lab.snp.makeConstraints{(make) in
            make.left.equalTo(button.snp.right).offset(0)
            make.top.bottom.equalToSuperview().offset(0)
        }

    }
//    未获取到视图
    required init?(coder: NSCoder) {
        fatalError("未获取到视图")
    }

}
