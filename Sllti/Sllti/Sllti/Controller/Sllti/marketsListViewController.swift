//
//  marketsListViewController.swift
//  Sllti
//
//  Created by ameer on 5/21/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import UIKit

class marketsListViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
     @IBOutlet weak var collection: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! marketsListCollectionViewCell
        //cell.marketImage = UIImage(named: "lion")
        cell.marketImage.image = UIImage(named: "lion")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
            return CGSize(width: collectionView.frame.size.width/4, height: collectionView.frame.size.height/3 - 20)
}

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.delegate = self
        collection.dataSource = self
    }

    

}
