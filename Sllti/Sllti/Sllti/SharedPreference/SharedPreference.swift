//
//  SharedPreference.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import Foundation

class SharedPreference {
    
    // MARK: - Singleton
    static let SharedInstans = SharedPreference()
    
    // MARK: - UserDefaults
    let defaults = UserDefaults.standard
    
    // MARK: - Properties
    let isLogin = "isLogin"
    let language = "language"
    let isResearcher = "isResearcher"
    
    
    // MARK: - Login Actions
    func setIsLogin(_ isLogin:Bool){
        defaults.set(isLogin, forKey: self.isLogin)
    }
    
    func getIsLogin()->Bool{
        if (UserDefaults.standard.object(forKey: self.isLogin) != nil) {
            return defaults.bool(forKey: isLogin)
        }else{
            return false
        }
    }
    
    // MARK: - Researcher Actions
    func setIsResearcher(_ isUser:Bool){
        defaults.set(isUser, forKey: self.isResearcher)
    }
    
    
    func getIsResearcher()->Bool{
        if (UserDefaults.standard.object(forKey: isResearcher) != nil) {
            return defaults.bool(forKey: self.isResearcher)
        }else{
            return false
        }
    }
    
    // MARK: - Language Actions
    func setLanguage(_ language: LanguageEnum){
        defaults.set(language.rawValue, forKey: self.language)
    }
    
    func getLanguage()->String{
        if (UserDefaults.standard.object(forKey: self.language) != nil) {
            return defaults.string(forKey: self.language)!
        }else{
            // Default value
            return "en"
        }
    }
    
    
}
