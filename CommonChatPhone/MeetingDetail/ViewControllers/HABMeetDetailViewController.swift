//
//  HABMeetDetailViewController.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2020/12/1.
//

import UIKit

@available(iOS 13.0, *)
class HABMeetDetailViewController: UIViewController {
    var age = Message(message: "dmeo")
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
    private let button : UIButton = {
        let button = UIButton()
        button.setTitle("点击网络请求", for: .normal)
        button.backgroundColor = .link
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(GetAction), for: .touchUpInside)
        return button
    } ()
    override func viewDidLoad() {
        super.viewDidLoad()
        p_setUpUI()
    }
    func p_setUpUI() {
        view.addSubview(headView)
        view.addSubview(meetDetailHorizionView)
        view.addSubview(button)
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
        button.snp.makeConstraints{(make) in
            make.top.equalTo(meetDetailHorizionView.snp.bottom).offset(0)
            make.right.left.equalToSuperview().offset(0)
            make.height.equalTo(50)
        }
    }
    @objc func GetAction() {
//        请求URL
        let url = NSURL(string: "http://localhost:8080/ping")
        var request = URLRequest(url: url! as URL)
        request.httpMethod = "GET"
                let configuration:URLSessionConfiguration = URLSessionConfiguration.default
                let session:URLSession = URLSession(configuration: configuration)
                let task:URLSessionDataTask = session.dataTask(with: request) { (data, response, error)->Void in
                    if error == nil{
                        do{
               let responseData:NSDictionary = try JSONSerialization.jsonObject(with: data!, options:   JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                            print("response:\(response)")
                            print("responseData:\(responseData)")
                            self.age.message = responseData["message"] as! String
                            print("\(String(describing: self.age.message))")
                  }catch{
                            print("catch")
                        }
                    }else{
                        print("error:\(error)")
                    }
                }
                task.resume()
    }
}
struct Message {
    var message : String?
}
