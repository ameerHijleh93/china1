//
//  ScalableTextField.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//


import UIKit

class ScalableTextField: UITextField {
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    public var scalableFontSize: Double = 15.0 {
        didSet {
            font = font?.withSize(scalableFontSize.scaledWidth())
        }
    }
    
    @IBInspectable
    public var leftMargin: CGFloat = 0.0 {
        didSet {
            if leftMargin > 0.0 && leftView == nil {
                addLeftMargin(width: leftMargin)
            }
        }
    }
    
    @IBInspectable
    public var rightMargin: CGFloat = 0.0 {
        didSet {
            if rightMargin > 0.0 && rightView == nil {
                addRightMargin(width: rightMargin)
            }
        }
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

