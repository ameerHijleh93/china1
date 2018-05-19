//
//  Styleguide.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import UIKit

extension FormItemView {
    static func createWith(title: String, placeholder: String?, itemType: FormItemTypeEnum, itemKeyboard: FormItemKeyboardTypeEnum = .alphanumeric) -> FormItemView {
        let formItemView = FormItemView()
        formItemView.title = title
        formItemView.placeholder = placeholder ?? ""
        formItemView.itemType = itemType
        formItemView.itemKeyboardType = itemKeyboard
        return formItemView
    }
}

extension UIStackView {
    convenience init(views: [UIView], axis: UILayoutConstraintAxis = .horizontal) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis
        distribution = UIStackViewDistribution.fillEqually
        spacing = 30.scaledWidth()
        views.forEach { self.addArrangedSubview($0) }
    }
}

enum Font {
    static func withSize(_ size: Int, weight: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size.scaledWidth(), weight: UIFont.Weight(rawValue: weight))
    }
}

extension TextStyle {
    
    static let formStyle = TextStyle(
        font: Font.withSize(16, weight: UIFont.Weight.regular.rawValue),
        color: UIColor(white: 107.0 / 255.0, alpha: 1.0),
        alignment: NSTextAlignment.left,
        numberOfLines: 1
    )
    
    static let formText = TextStyle(
        font: Font.withSize(18, weight: UIFont.Weight.medium.rawValue),
        color: UIColor.battleshipGrey
    )
    
    
}

extension TextStyle {
    
    enum Button {
        
        static let createStyle = TextStyle(
            font: Font.withSize(17, weight: UIFont.Weight.heavy.rawValue),
            color: UIColor.white
        )
        
    }
}
