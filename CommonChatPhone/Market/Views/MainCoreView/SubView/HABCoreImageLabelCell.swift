//
//  HABCoreImageLabelCell.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2020/12/9.
//

import UIKit

@available(iOS 13.0, *)
class HABCoreImageLabelCell: UICollectionViewCell {
    private let iconImage: UIImageView = {
       let imgView = UIImageView()
        imgView.image = UIImage.init(systemName: "book.fill")
        
        return imgView
    }()
    private let iconLab : UILabel = {
        let lab = UILabel()
        lab.text = "帮助说明"
        lab.textAlignment = .center
        lab.numberOfLines = 1
        lab.font = .boldSystemFont(ofSize: 14)
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
        self.backgroundColor = UIColor.hexColor_FFFFFF()
        addSubview(iconImage)
        addSubview(iconLab)
        p_addMasonry()
    }
    func p_addMasonry() {
        iconImage.snp.makeConstraints{(make) in
            make.centerX.equalToSuperview().offset(0)
            make.top.equalToSuperview().offset(5)
            make.size.equalTo(CGSize(width: 32, height: 32))
        }
        iconLab.snp.makeConstraints{(make) in
            make.top.bottom.equalToSuperview().offset(10)
            make.right.left.equalToSuperview().offset(0)
        }
    }
    func p_setUpData() {
        
    }
}
