//
//  Image+AssetIdentifier.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//


import UIKit

extension UIImage {
    
    enum AssetIdentifier: String {
        case erase = "erase"
        case drop = "drop"
        case calendar = "calendarIcon"
        
    }
    
    /**
     Generates a UIImage from a AssetIdentifier enum
     - Returns: a non nil UIImage instance.
     */
    convenience init?(assetIdentifier: AssetIdentifier) {
        self.init(named: assetIdentifier.rawValue)
    }
}
