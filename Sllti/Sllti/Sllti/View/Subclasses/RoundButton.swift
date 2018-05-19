//
//  RoundButton.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//


import UIKit

@IBDesignable public class RoundButton: UIButton {
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    public var scalableTitleFontSize: Double = 15.0 {
        didSet {
            titleLabel?.font = titleLabel?.font.withSize(scalableTitleFontSize.scaledWidth())
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        makeCircular()
        clipsToBounds = true
    }
}
