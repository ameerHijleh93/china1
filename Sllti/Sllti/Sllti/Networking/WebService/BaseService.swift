//
//  BaseService.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import UIKit
import Moya
import ObjectMapper

class BaseService: NSObject {
    func request<T: TargetType, M: Mappable>(endpoint: T, provider: MoyaProvider<T>, completion: @escaping (M?, Swift.Error?)->()) {
        provider.request(endpoint) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    if moyaResponse.statusCode == 400 {
                        let successResponse = try moyaResponse.filter(statusCode: moyaResponse.statusCode)
                        let json = try (successResponse.mapJSON() as? [String: AnyObject])
                        if json!["error"] != nil {
                            if var errorString = json!["error"]! as? String {
                                let range = errorString.range(of: ": ", options: NSString.CompareOptions.backwards)
                                errorString = ((errorString.substring(from: (range?.lowerBound)!) as AnyObject) as? String)!
                                let errorObject = NSError(domain: "", code: moyaResponse.statusCode, userInfo: ["error": errorString])
                                completion(nil, errorObject)
                            } else {
                                let errorObject = NSError(domain: "", code: moyaResponse.statusCode, userInfo: ["error": json!])
                                completion(nil, errorObject)
                            }
                        } else {
                            let error = NSError(domain: "", code: moyaResponse.statusCode, userInfo: ["error": "Failure parsing response object"])
                            completion(nil, error)
                        }
                    } else {
                        let successResponse = try moyaResponse.filterSuccessfulStatusCodes()
                        let json = try successResponse.mapJSON()
                        let responseObject = Mapper<M>().map(JSONObject: json)
                        completion(responseObject, nil)
                    }
                } catch {
                    completion(nil, error)
                }
            case let .failure(error):
                completion(nil, error)
            }
        }
    }
    
    func request<T: TargetType>(endpoint: T, provider: MoyaProvider<T>, completion: @escaping (Bool, Swift.Error?)->()) {
        provider.request(endpoint) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let successResponse = try moyaResponse.filter(statusCode: moyaResponse.statusCode)
                    let json = try (successResponse.mapJSON() as? [String: AnyObject])
                    if json != nil {
                        if json!["localizedMessage"] != nil {
                            if let errorString = json!["localizedMessage"] as? String {
                                let range = errorString.range(of: " (", options: NSString.CompareOptions.backwards)
                                let convertedString = errorString.substring(to: (range?.lowerBound)!) as AnyObject
                                let errorObject = NSError(domain: "", code: moyaResponse.statusCode, userInfo: ["error": convertedString])
                                completion(true, errorObject)
                            }
                        }
                    }
                    completion(true, nil)
                } catch {
                    completion(true, nil)
                }
            case let .failure(error):
                completion(false, error)
            }
        }
    }
}
