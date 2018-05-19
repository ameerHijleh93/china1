//
//  ViewController+Identifier.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import UIKit

// MARK: - UIStoryboard extension
extension UIViewController {
    
    /// Match UIViewController with it's `Identifier` name so we don't relay on unsafe strings distributed
    /// in the code base.
    ///
    enum Identifier: String {
        case test = "Test"
    }
}
