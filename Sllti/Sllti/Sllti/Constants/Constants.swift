//
//  Constants.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Typealiases
typealias EmptyClosure = ()->()

// MARK: - Constants
public struct Constants {
    
    struct Web {
        static let baseURLString = (Bundle.main.infoDictionary!["API_BASE_URL"] as? String)!
        static let baseURL: URL? = URL(string: Web.baseURLString)
    }
    
    // Size of the designs, everything will scale from this so we are ready
    // for smaller/bigger devices
    private struct DesignSize {
        static let width: CGFloat = 1366
        static let height: CGFloat = 1024
    }
    
    
    
    struct Scale {
        static let width: CGFloat = UIScreen.main.bounds.size.width/DesignSize.width
        static let height: CGFloat = UIScreen.main.bounds.size.height/DesignSize.height
        static let expandedHeight: CGFloat = UIScreen.main.bounds.size.height/1024
    }
    
    struct Service {
        static let defaultPageSize: Int! = (Bundle.main.infoDictionary!["DEFAULT_PAGE_SIZE"] as? Int)!
    }
    
    struct Environment {
        static let sandbox: Int = 0
        static let production: Int = 1
    }
}
