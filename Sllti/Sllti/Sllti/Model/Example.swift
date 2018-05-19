//
//  Example.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import ObjectMapper

class Example: Mappable{
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
    }
    
    
}

//import Foundation
//import ObjectMapper
//import RealmSwift
//
//class CategoryModel : Object,Mappable {
//    
//    @objc dynamic var id = -1
//    @objc dynamic var categoryNameAr : String? = ""
//    @objc dynamic var categoryNameEng : String? = ""
//    @objc dynamic var imageUrl : String? = ""
//    
//    
//    required convenience init?(map: ObjectMapper.Map) {
//        self.init()
//    }
//    
//    func mapping(map: ObjectMapper.Map) {
//        
//        id   <- map["id"]
//        categoryNameAr   <- map["categoryNameAr"]
//        categoryNameEng   <- map["categoryNameEng"]
//        imageUrl   <- map["imageUrl"]
//        
//        
//    }
//}

