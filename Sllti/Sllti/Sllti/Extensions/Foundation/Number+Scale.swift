//
//  Number+Scale.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    func scaledWidth() -> CGFloat {
        return CGFloat(self) * Constants.Scale.width
    }
    
    func scaledHeight() -> CGFloat {
        return CGFloat(self) * Constants.Scale.height
    }
    
    func maximumScaling() -> CGFloat {
        return min(scaledWidth(), scaledHeight())
    }
}

extension Int {
    func scaledWidth() -> CGFloat {
        return CGFloat(self) * Constants.Scale.width
    }
    
    func scaledHeight() -> CGFloat {
        return CGFloat(self) * Constants.Scale.height
    }
    
    func expandedHeight() -> CGFloat {
        return CGFloat(self) * Constants.Scale.expandedHeight
    }
}
