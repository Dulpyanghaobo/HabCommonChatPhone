//
//  CCHomeHeadTaskPancelView.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2021/7/3.
//

import UIKit

class CCHomeHeadTaskPancelItemView: UIView {
    private let titleLab : UILabel = {
        let lab = UILabel()
        lab.textAlignment = .center
        lab.numberOfLines = 1
        lab.font = .boldSystemFont(ofSize: 16)
        lab.textColor = UIColor.hexColor_999999()
        return lab
    }()
    private let descLab : UILabel = {
        let lab = UILabel()
        lab.textAlignment = .center
        lab.numberOfLines = 1
        lab.font = .boldSystemFont(ofSize: 16)
        lab.textColor = UIColor.hexColor_333333()
        return lab
    }()
    private let progressView: UIProgressView = {
        let progress = UIProgressView (progressViewStyle: .default)
        progress.progress = 0.5
        return progress
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        p_setUpUI()
    }
    required init?(coder: NSCoder) {
        fatalError("Cell create error")
    }
    
    func p_setUpUI() {
        self.addSubview(titleLab)
        self.addSubview(descLab)
        self.addSubview(progressView)
        
    }
    func addMasonry() {
        titleLab.snp.makeConstraints{(make) in
            make.top.equalToSuperview().offset(4)
            make.centerX.equalToSuperview()
        }
        progressView.snp.makeConstraints{(make) in
            make.center.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(4)
        }
        descLab.snp.makeConstraints{(make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(progressView.snp.bottom)
        }
    }
}

class CCHomeHeadTaskPancelView: UIView {

    private let leftPancelView : CCHomeHeadTaskPancelItemView = {
        let pancelView = CCHomeHeadTaskPancelItemView()
        
        
        return pancelView
    } ()
    private let centerPancelView : CCHomeHeadTaskPancelItemView = {
        let pancelView = CCHomeHeadTaskPancelItemView()
        
        
        return pancelView
    } ()
    private let rightPancelView : CCHomeHeadTaskPancelItemView = {
        let pancelView = CCHomeHeadTaskPancelItemView()
        
        
        return pancelView
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        p_setUpUI()
    }
    required init?(coder: NSCoder) {
        fatalError("Cell create error")
    }
    
    func p_setUpUI() {
        self.addSubview(leftPancelView)
        self.addSubview(centerPancelView)
        self.addSubview(rightPancelView)
    }
    
    func addMasonry() {
        leftPancelView.snp.makeConstraints{(make) in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
        }
        centerPancelView.snp.makeConstraints{(make) in
            make
        }
        rightPancelView.snp.makeConstraints{(make) in
            make
        }
        
    }

}





