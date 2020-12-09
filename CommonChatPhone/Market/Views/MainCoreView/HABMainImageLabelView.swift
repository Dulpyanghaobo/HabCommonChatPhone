//
//  HABMainImageLabelView.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2020/12/9.
//

import UIKit

@available(iOS 13.0, *)
class HABMainImageLabelView: UIView {
    public var callback : SelectedCallBack?
    private let myCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: fiveCellWidth, height: 77)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HABCoreImageLabelCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        p_setUpUI()
        p_setUpData()
    }
    required init?(coder: NSCoder) {
        fatalError("Cell create error")
    }
    func p_setUpUI() {
        addSubview(myCollectionView)
        p_addMasonry()
    }
    func p_addMasonry() {
        myCollectionView.snp.makeConstraints{(make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
    }
    func p_setUpData() {
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }
}
@available(iOS 13.0, *)
extension HABMainImageLabelView : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        callback!(indexPath.row)
        
    }
}
@available(iOS 13.0, *)
extension HABMainImageLabelView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
}
//    MARK: - 回调事件
@available(iOS 13.0, *)
extension HABMainImageLabelView {
    func callBackBlock(block:@escaping (_ obj: Any) ->Void) {
        callback = block
    }
}
