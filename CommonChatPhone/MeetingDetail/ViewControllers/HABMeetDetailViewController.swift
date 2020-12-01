//
//  HABMeetDetailViewController.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2020/12/1.
//

import UIKit

@available(iOS 13.0, *)
class HABMeetDetailViewController: UIViewController {
    private let headView : HABMeetDetailView = {
        let headView = HABMeetDetailView()
        headView.backgroundColor = .white
        return headView
    }()
    private let meetDetailHorizionView : HABMeetDetailHorizenSliderView = {
       let view = HABMeetDetailHorizenSliderView()
        view.backgroundColor = .white
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        p_setUpUI()
    }
    func p_setUpUI() {
        view.addSubview(headView)
        view.addSubview(meetDetailHorizionView)
        headView.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(0)
            make.left.right.equalToSuperview().offset(0)
            make.height.equalTo(160)
        }
        meetDetailHorizionView.snp.makeConstraints{(make) in
            make.top.equalTo(headView.snp.bottom).offset(12)
            make.right.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.height.equalTo(60)
        }
    }
}
