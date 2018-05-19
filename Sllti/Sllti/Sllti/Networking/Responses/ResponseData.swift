//
//  ResponseData.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import Foundation
import ObjectMapper

struct ResponseData: Mappable {
    
    var last: Bool?
    var totalPages: Int?
    var totalElements: Int?
    var first: Bool?
    var sort: String?
    var numberOfElements: Int?
    var size: Int?
    var number: Int?
    
    // MARK: JSON
    init?(map: Map) {
        if map.JSON[Keys.last] == nil { self.last = false }
        if map.JSON[Keys.totalPages] == nil { self.totalPages = 0 }
        if map.JSON[Keys.totalElements] == nil { self.totalElements = 0 }
        if map.JSON[Keys.first] == nil { self.first = false }
        if map.JSON[Keys.sort] == nil { self.sort = "" }
        if map.JSON[Keys.numberOfElements] == nil { self.numberOfElements = 0 }
        if map.JSON[Keys.size] == nil { self.size = 0 }
        if map.JSON[Keys.number] == nil { self.number = 0 }
    }
    
    mutating func mapping(map: Map) {
        last             <- map[Keys.last]
        totalPages       <- map[Keys.totalPages]
        totalElements    <- map[Keys.totalElements]
        first            <- map[Keys.first]
        sort             <- map[Keys.sort]
        numberOfElements <- map[Keys.numberOfElements]
        size             <- map[Keys.size]
        number           <- map[Keys.number]
    }
}

extension ResponseData {
    fileprivate struct Keys {
        static let last = "last"
        static let totalPages = "totalPages"
        static let totalElements = "totalElements"
        static let first = "first"
        static let sort = "sort"
        static let numberOfElements = "numberOfElements"
        static let size = "size"
        static let number = "number"
    }
}
