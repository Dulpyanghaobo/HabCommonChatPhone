//
//  HabMeetDetailRowsHorizenCell.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2020/12/2.
//

import UIKit

class HabMeetDetailRowsHorizenCell: UICollectionViewCell {
    private let titleLab : UILabel = {
        let lab = UILabel()
        lab.text = "文艺类"
        lab.textAlignment = .right
        lab.numberOfLines = 1
        lab.font = .systemFont(ofSize: 16)
        return lab
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        p_setUpUI()
    }
    required init?(coder: NSCoder) {
        fatalError("Cell create error")
    }
    func p_setUpUI() {
        contentView.addSubview(titleLab)
        p_addMasonry()
    }
    func p_addMasonry() {
        titleLab.snp.makeConstraints{(make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    func p_setUpData() {
        
    }
}
