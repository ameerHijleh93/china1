//
//  String+Util.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import Foundation


extension String {
    
    /// Checks if a string is empty or only composed by whitespaces and new lines (\n).
    var  isBlank: Bool {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty
    }
    
    var URLEscapedString: String {
        return self.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlHostAllowed)!
    }
    
    func capitalizeFirst() -> String {
        let firstIndex = index(startIndex, offsetBy: 1)
        return substring(to: firstIndex).capitalized + substring(from: firstIndex).lowercased()
    }
    
    
}

extension Optional where Wrapped == String {
    var isBlank: Bool {
        return self?.isBlank ?? true
    }
    
    var value: String {
        return self ?? ""
    }
}
