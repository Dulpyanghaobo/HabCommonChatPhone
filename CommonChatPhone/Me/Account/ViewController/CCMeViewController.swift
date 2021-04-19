//
//  CCMeViewController.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2021/4/19.
//

import UIKit

class CCMeViewController: UIViewController {
    private let tableView : UITableView = {
        let tableView = UITableView()

        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension CCMeViewController : UITableViewDelegate {
    
}
extension CCMeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
