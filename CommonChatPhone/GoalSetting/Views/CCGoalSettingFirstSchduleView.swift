//
//  CCGoalSettingFirstSchdule.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2021/7/10.
//

import UIKit

class CCGoalSettingFirstSchduleView: NiblessView {
    
    fileprivate let bottomView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.hexColor_FFFFFF()
        
        return view
    }()
    
    fileprivate let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "欢迎来到微管"
        label.textColor = UIColor.hexColor_333333()
        label.font = UIFont.PingFangMedium(32)
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate let descLabel : UILabel = {
        let label = UILabel()
        label.text = "我将是你未来的管家小顾，让我帮助你更好的生活吧！"
        label.textColor = UIColor.hexColor_666666()
        label.font = UIFont.PingFangRegular(22)
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.init(named: "goalSetting_doctor")
        return imageView
    } ()
    /// 淡蓝色按钮
    fileprivate let moneyButton : UIButton = {
        let button = UIButton()
        button.setTitle("获得财富", for: .normal)
        button.backgroundColor = .systemYellow
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.titleLabel?.font = .PingFangMedium(16)
        button.addTarget(self, action: #selector(didMoneyClick), for: .touchUpInside)
        return button
    } ()
    
    /// 渐变色绿色
    fileprivate let healthButton : UIButton = {
        let button = UIButton()
        button.setTitle("获得健康", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.titleLabel?.font = .PingFangMedium(16)
        button.addTarget(self, action: #selector(didHealthClick), for: .touchUpInside)
        return button
    } ()
    
    fileprivate let knowledgeButton : UIButton = {
        let button = UIButton()
        button.setTitle("获得知识", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.layer.masksToBounds = true
        button.titleLabel?.font = .PingFangMedium(16)
        button.addTarget(self, action: #selector(didKnowledgeClick), for: .touchUpInside)
        return button
    } ()

    override init(frame: CGRect) {
        super.init(frame: frame)
        p_setUpUI()
    }
    
    @objc private func didMoneyClick() {
        
    }
    
    @objc private func didHealthClick() {
        
    }
    
    @objc private func didKnowledgeClick() {
        
    }
    
    func p_setUpUI() {
        addSubview(titleLabel)
        addSubview(descLabel)
        addSubview(imageView)
        addSubview(bottomView)
        bottomView.addSubview(knowledgeButton)
        bottomView.addSubview(healthButton)
        bottomView.addSubview(moneyButton)
        p_addMasonry()
    }
    func p_addMasonry() {
        titleLabel.snp.makeConstraints{(make) in
            make.left.equalToSuperview().offset(32)
            make.top.equalToSuperview().offset(KNavigationBarHeight)
            make.width.lessThanOrEqualTo(180)
        }
        descLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(titleLabel)
            make.right.equalToSuperview().offset(-80)
        }

        bottomView.snp.makeConstraints{(make) in
            make.bottom.right.left.equalToSuperview().offset(0)
        }
        healthButton.snp.makeConstraints{(make) in
            make.height.equalTo(44)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-4)
        }
        moneyButton.snp.makeConstraints{(make) in
            make.height.equalTo(44)
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.bottom.equalTo(healthButton.snp.top).offset(-12)
        }
        knowledgeButton.snp.makeConstraints{(make) in
            make.height.equalTo(moneyButton.snp.height)
            make.left.equalTo(moneyButton)
            make.right.equalTo(moneyButton)
            make.bottom.equalTo(moneyButton.snp.top).offset(-12)
            make.top.equalToSuperview().offset(12)
        }

        imageView.snp.makeConstraints{(make) in
            make.left.equalTo(titleLabel)
            make.bottom.equalTo(bottomView.snp.top).offset(4)
            make.size.equalTo(CGSize(width: 200, height: 200))
        }
    }
    func p_setUpData() {
        
    }

}
