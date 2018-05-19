//
//  AlamofireManager.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import Foundation
import Alamofire
import Moya

class AlamofireManager: Alamofire.SessionManager {
    static let sharedManager: AlamofireManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return AlamofireManager(configuration: configuration)
    }()
}
