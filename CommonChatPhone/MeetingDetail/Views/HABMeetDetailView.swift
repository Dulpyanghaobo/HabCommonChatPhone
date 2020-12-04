//
//  HABMeetDetailView.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2020/12/1.
//

import UIKit
import SnapKit

@available(iOS 13.0, *)
class HABMeetDetailView: UIView {
    private let titleLab : UILabel = {
        let lab = UILabel()
        lab.text = "你好,Hab"
        lab.textAlignment = .left
        lab.numberOfLines = 1
        lab.font = .boldSystemFont(ofSize: 16)
        return lab
    }()
    
    private let profileButton : UIButton = {
        let button = UIButton()
        let image : UIImage?
        image = UIImage(systemName: "person.circle.fill" ,withConfiguration: UIImage.SymbolConfiguration(textStyle: .largeTitle))
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 24
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(doTapProfile), for: .touchUpInside)
        return button
    } ()
    
    private let headTitleLab : UILabel = {
        let lab = UILabel()
        lab.text = "Check your Meetings Details"
        lab.textAlignment = .left
        lab.numberOfLines = 2
        lab.font = .boldSystemFont(ofSize: 30)
        return lab
    }()
    private let addMeetingButton : UIButton = {
        let button = UIButton()
        button.setTitle("ADD", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        button.addTarget(self, action: #selector(didTapAdd), for: .touchUpInside)
        return button
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        p_setUpUI()
        p_setUpData()
    }
    func p_setUpUI() {
        self.addSubview(self.titleLab)
        self.addSubview(self.headTitleLab)
        self.addSubview(self.addMeetingButton)
        self.addSubview(self.profileButton)
        p_addMasonry()
    }
    func p_addMasonry() {
        profileButton.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-16)
            make.size.equalTo(CGSize.init(width: 48, height: 48))
        }
        titleLab.snp.makeConstraints{(make) in
            make.centerY.equalTo(profileButton.snp.centerY)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(24)
            make.right.lessThanOrEqualTo(profileButton.snp.left).offset(-12)
        }
        addMeetingButton.snp.makeConstraints{(make) in
            make.right.equalTo(profileButton.snp.right)
            make.bottom.equalToSuperview().offset(-16)
        }
        headTitleLab.snp.makeConstraints{(make) in
            make.bottom.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(16)
            make.right.lessThanOrEqualTo(addMeetingButton.snp.left).offset(-12)
            make.top.equalTo(titleLab.snp.bottom).offset(12)
        }

        
    }
    
    func p_setUpData() {
        
    }
    required init?(coder: NSCoder) {
        fatalError("错误")
    }
    @objc private func doTapProfile() {
        
    }
    @objc private func didTapAdd() {
        print("添加会议")
    }
}


