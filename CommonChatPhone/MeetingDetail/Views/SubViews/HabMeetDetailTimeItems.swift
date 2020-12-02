//
//  HabMeetDetailTimeItems.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2020/12/2.
//

import UIKit

class HabMeetDetailTimeItems: UIView {
    var leftStr : String = "00"
    var rightStr : String = "00"
    private let leftLab : UILabel = {
        let lab = UILabel()
        lab.numberOfLines = 1
        lab.textAlignment = .center
        lab.textColor = UIColor.black
        lab.font = .systemFont(ofSize: 14)
        lab.backgroundColor = UIColor.clear
        return lab
    }()
    private let rightLab : UILabel = {
        let lab = UILabel()
        lab.numberOfLines = 1
        lab.textAlignment = .center
        lab.textColor = UIColor.black
        lab.font = .systemFont(ofSize: 14)
        lab.backgroundColor = UIColor.clear
        return lab
    }()
    private let sepView : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        p_setUpUI()
    }
    required init?(coder: NSCoder) {
        fatalError("Cell create error")
    }
    private func p_setUpUI() {
        addSubview(leftLab)
        addSubview(rightLab)
        addSubview(sepView)
        p_addMasonry()
    }
    private func p_addMasonry() {
        leftLab.snp.makeConstraints{(make) in
            make.left.equalToSuperview().offset(0)
            make.top.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
        }
        rightLab.snp.makeConstraints{(make) in
            make.right.equalToSuperview().offset(0)
            make.top.bottom.equalToSuperview().offset(0)
        }
        sepView.snp.makeConstraints{(make) in
            make.center.equalToSuperview().offset(0)
            make.width.equalTo(24)
            make.height.equalTo(1)
        }
    }
    public func p_setUpData() {
        leftLab.text = leftStr
        rightLab.text = rightStr
    }

}
