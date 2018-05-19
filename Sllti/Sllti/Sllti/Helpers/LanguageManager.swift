//
//  LanguageManager.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import Foundation

class LanguageManager: NSObject{
    
    // MARK: - Singleton
    static let SharedInstans = LanguageManager()
    
    // MARK: - Actions
    func  getValueFor(key:String)->String {
        let lang = SharedPreference.SharedInstans.getLanguage()
        if let path = Bundle.main.path(forResource: lang, ofType: "json") {
            do {
                let jsonData : NSData = NSData(contentsOfFile: path)!
                let  allEntries = try JSONSerialization.jsonObject(with: jsonData as Data, options: []) as! NSDictionary
                return allEntries.object(forKey: key) as? String == nil ? "_"+key :  allEntries.object(forKey: key) as! String
            }catch _{
                return "_"+key
            }
        }
        return "_"+key
    }
}
