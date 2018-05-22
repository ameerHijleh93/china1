//
//  ItemesViewController.swift
//  Sllti
//
//  Created by ameer on 5/20/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import UIKit

class ItemesViewController: UIViewController /*,UICollectionViewDelegate , UICollectionViewDataSource*/ {
    @IBOutlet weak var itemsCoolectionView: UICollectionView!
    @IBOutlet weak var myView: UICollectionView!

//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = itemsCoolectionView.dequeueReusableCell(withReuseIdentifier: "ItemsCell", for: indexPath) as! ItemsCollectionViewCell
//        cell.imgeItems.image = UIImage(named: "lion")
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
//    {
//        return CGSize(width: 1000, height: 800.0)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
//       itemsCoolectionView.delegate = self
//        itemsCoolectionView.dataSource = self

    }

    
}
