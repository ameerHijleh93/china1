//
//  ScalableButton.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import UIKit

class ScalableButton: UIButton {
    @IBInspectable
    public var scalableTitleFontSize: Double = 15.0 {
        didSet {
            titleLabel?.font = titleLabel?.font.withSize(scalableTitleFontSize.scaledWidth())
        }
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        let border = CALayer()
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: thickness)
        case UIRectEdge.bottom:
            border.frame = CGRect.init(x: 0, y: frame.height - thickness, width: frame.width, height: thickness)
        case UIRectEdge.left:
            border.frame = CGRect.init(x: 0, y: frame.height/4, width: thickness, height: frame.height/2)
        case UIRectEdge.right:
            border.frame = CGRect.init(x: frame.width - thickness, y: frame.height/4, width: thickness, height: frame.height/2)
        default:
            break
        }
        border.backgroundColor = color.cgColor
        self.layer.addSublayer(border)
    }
}
