//
//  ExampleRwsponse.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import Foundation
import ObjectMapper

struct ExampleRwsponse: Mappable {
    
    var content: [Example]?
    var data: ResponseData?
    
    // MARK: JSON
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        content <- map[Keys.content]
        data = ResponseData(map: map)
    }
}

extension ExampleRwsponse {
    fileprivate struct Keys {
        static let content = "content"
    }
}
