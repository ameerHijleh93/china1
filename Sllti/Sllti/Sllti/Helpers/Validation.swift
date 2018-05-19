//
//  Validation.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import UIKit

class Validation {
    
    static func validate(textField: UITextField) -> UITextField? {
        if textField.isRequired == .enabled {
            if (textField.text?.isEmpty)! {
                textField.backgroundColor = .alertRed
                textField.attributedPlaceholder = NSAttributedString(string: "Required!", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
            } else {
                textField.backgroundColor = .white
                textField.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
            }
        }
        return textField
    }
}
