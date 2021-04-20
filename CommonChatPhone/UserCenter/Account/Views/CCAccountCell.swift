//
//  CCAccountCell.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2021/4/21.
//

import UIKit
enum CCAccountType : Int {
    case CCAccountTypeName = 0
    case Gender = 1
         
}
class CCAccountCell: UITableViewCell {

    private let rightLab : UILabel = {
        let lab = UILabel()
        lab.text = "你好,Hab"
        lab.textAlignment = .right
        lab.numberOfLines = 1
        lab.font = .boldSystemFont(ofSize: 16)
        return lab
    }()
    private let button : UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        if #available(iOS 13.0, *) {
            button.backgroundColor = .link
        } else {
            button.backgroundColor = .red
        }
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return button
    } ()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
        contentView.addSubview(rightLab)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @objc func didTapLogin() {
        
    }
}
