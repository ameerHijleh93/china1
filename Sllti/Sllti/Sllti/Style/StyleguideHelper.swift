//
//  StyleguideHelper.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import UIKit

// MARK: Structs
struct TextStyle {
    let font: UIFont
    let color: UIColor
    let alignment: NSTextAlignment
    let numberOfLines: Int
    
    init(font: UIFont, color: UIColor, alignment: NSTextAlignment = NSTextAlignment.left, numberOfLines: Int = 1) {
        self.font = font
        self.color = color
        self.alignment = alignment
        self.numberOfLines = numberOfLines
    }
}

// MARK: Helper protocols
protocol TextStyling {
    func style(style: TextStyle)
}

extension UILabel: TextStyling {
    func style(style: TextStyle) {
        font = style.font
        textColor = style.color
        textAlignment = style.alignment
        numberOfLines = style.numberOfLines
    }
}

extension UIButton: TextStyling {
    
    func style(style: TextStyle) {
        titleLabel?.style(style: style)
        setTitleColor(style.color, for: .normal)
    }
}

extension UITextField: TextStyling {
    
    func style(style: TextStyle) {
        font = style.font
        textColor = style.color
    }
}

extension UITextView: TextStyling {
    
    func style(style: TextStyle) {
        font = style.font
        textColor = style.color
    }
}
