//
//  CCAccountTableViewCell.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2021/4/19.
//

import UIKit

class CCAccountTableViewCell: UITableViewCell {

    private let leftLab : UILabel = {
        let lab = UILabel()
        lab.text = "你好,Hab"
        lab.textAlignment = .right
        lab.numberOfLines = 1
        lab.font = .boldSystemFont(ofSize: 16)
        return lab
    }()
    private let rightLab : UILabel = {
        let lab = UILabel()
        lab.text = "你好,Hab"
        lab.textAlignment = .right
        lab.numberOfLines = 1
        lab.font = .boldSystemFont(ofSize: 16)
        return lab
    }()
    
    private let rightButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage.init(named: "account_go_icon"), for: .normal)
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return button
    } ()
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(leftLab)
        contentView.addSubview(rightLab)
        contentView.addSubview(rightButton)
        p_setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func p_setUpUI() {
        p_addMasonry()
    }
    func p_addMasonry() {
        leftLab.snp.makeConstraints{(make) in
            make.
        }
    }
    func p_setUpData() {
        
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc func didTapLogin() {
        
    }
}
