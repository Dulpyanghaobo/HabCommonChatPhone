//
//  CCHomeViewController.swift
//  CommonChatPhone
//
//  Created by 杨皓博 on 2021/7/3.
//

import UIKit

class CCHomeViewController: UIViewController {

    let collectionView : UICollectionView = {
        let view = UICollectionView()

        return view;
    } ()
//    override var collectionView: UICollectionView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self;
        collectionView.delegate = self;
    }
    

}

extension CCHomeViewController : UICollectionViewDelegate
{

    
    
    
}

extension CCHomeViewController : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
}
