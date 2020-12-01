//
//  HABMeetDetailHorizenSliderView.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2020/12/1.
//

import UIKit

class HABMeetDetailHorizenSliderView: UIView {
    private let collection : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 30)
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(HabMeetDetailRowsHorizenCell.self, forCellWithReuseIdentifier: "MyCell")
        collection.backgroundColor = .clear
        return collection
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        collection.delegate = self
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false;
        addSubview(collection)
            collection.snp.makeConstraints{(make) in
                make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
            }
    }
    required init?(coder: NSCoder) {
        fatalError("加载错误")
    }
}
extension HABMeetDetailHorizenSliderView:UICollectionViewDelegate {
    
}
extension HABMeetDetailHorizenSliderView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! HabMeetDetailRowsHorizenCell
        myCell.backgroundColor = UIColor.clear
        return myCell
    }
    
    
}
