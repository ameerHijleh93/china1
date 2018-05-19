//
//  ScalableTextView.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import UIKit

class ScalableTextView: UITextView {
    
    @IBInspectable
    public var scalableFontSize: Double = 15.0 {
        didSet {
            font = font?.withSize(scalableFontSize.scaledWidth())
        }
    }
}
