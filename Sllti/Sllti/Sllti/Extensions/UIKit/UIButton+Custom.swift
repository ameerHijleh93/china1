//
//  UIButton+Custom.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setScaled(imageAssetIdentifier identifier: UIImage.AssetIdentifier) {
        let image = UIImage(assetIdentifier: identifier)
        setImage(image?.scaled(), for: UIControlState.normal)
    }
    
}
