//
//  CCAccountViewController.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2021/4/20.
//

import UIKit

class CCAccountViewController: UIViewController {
    private let bottomView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.hexColor_FFFFFF()
        
        return view
    } ()
    private let bottomButton : UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.hexColor_28A751()
        button.layer.cornerRadius = 24
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return button
    } ()
    
    private let mainTableView : UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .singleLine
        
        return tableView
    } ()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Account"
        view.backgroundColor = UIColor.hexColor_FFFFFF()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        p_setUpUI()
    }

    func p_setUpUI() {
        view.addSubview(bottomView)
        bottomView.addSubview(bottomButton)
        view.addSubview(mainTableView)
        p_addMasonry()
    }
    func p_addMasonry() {
        bottomView.snp.makeConstraints{(make) in
            make.right.left.bottom.equalToSuperview().offset(0)
            make.height.equalTo(64 + bottomPadding)
        }
        bottomButton.snp.makeConstraints{(make) in
            make.left.equalToSuperview().offset(118)
            make.right.equalToSuperview().offset(-118)
            make.bottom.equalToSuperview().offset(-20 - bottomPadding)
            make.top.equalToSuperview()
        }
        mainTableView.snp.makeConstraints{(make) in
            make.top.left.right.equalToSuperview().offset(0)
            make.bottom.equalTo(self.bottomView.snp.top)
        }
    }
    func p_setUpData() {
        
    }
    @objc func didTapLogin() {
        
    }

}


extension CCAccountViewController : UITableViewDelegate {
    
}

extension CCAccountViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "friends[indexPath.row]"
        return cell
    }
    
    
}
