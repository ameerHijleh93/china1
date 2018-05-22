//
//  maineViewController.swift
//  Sllti
//
//  Created by ameer on 5/21/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import UIKit

class maineViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate {
    @IBOutlet weak var collectionTwo: UICollectionView!
    @IBOutlet weak var collection: UICollectionView!
   

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if collection.tag == 0 {
        return 20
            } else {
                return 5 }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collection.tag == 0 {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! marketsCollectionViewCell
        //cell.marketImage = UIImage(named: "lion")
        cell.marktsImage.image = UIImage(named: "lion")
            return cell }
//        else{
//            let celll = collectionTwo.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! marketsImageCollectionViewCell
//            //cell.marketImage = UIImage(named: "lion")
//            celll.imge.image = UIImage(named: "ic_no_wifi")
//            return celll
//        }
   
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! marketsCollectionViewCell
        //cell.marketImage = UIImage(named: "lion")
        cell.marktsImage.image = UIImage(named: "lion")
        return cell }
        
    
    
    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 200, height: 200) }

//        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//            return CGSizeMake(123, 123);
//        }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
        collectionTwo.dataSource = self
        collectionTwo.delegate = self
      
    }

   

//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
//        return 100;
//    }

  
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 600;
    }
   
}
