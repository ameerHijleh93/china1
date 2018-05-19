//
//  TexitField+Util.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import UIKit

struct AssociatedKeys {
    static var isRequired: UInt8 = 0
}

enum IsRequired {
    case enabled
    case disabled
}

extension UITextField {
    
    var isRequired: IsRequired {
        get {
            guard let value = objc_getAssociatedObject(self, &AssociatedKeys.isRequired) as? IsRequired else {
                return .disabled
            }
            return value
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.isRequired, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func addLeftMargin(width: CGFloat) {
        let leftMarginView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 5.0))
        leftView = leftMarginView
        leftViewMode = UITextFieldViewMode.always
    }
    
    func addRightMargin(width: CGFloat) {
        let rightMarginView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 5.0))
        rightView = rightMarginView
        rightViewMode = UITextFieldViewMode.always
    }
    
}

