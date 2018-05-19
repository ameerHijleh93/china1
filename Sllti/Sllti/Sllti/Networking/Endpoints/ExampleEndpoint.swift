//
//  ExampleEndpoint.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//

import Moya

public enum ExampleEndpoint {
    case example
    case exampleWith(id: String, params: Any)
    case create(example: [String: Any])
    case deleteExample(id: String)
    case update(example: [String: Any])
}

extension ExampleEndpoint: TargetType {
    
    // MARK: - BaseURL
    public var baseURL: URL { return URL(string: Constants.Web.baseURLString)! }
    
    // MARK: - Path
    public var path: String {
        switch self {
        case .example, .create, .update:
            return "/example/example1"
        case .deleteExample(let id), .exampleWith( let id, _):
            return "/example/example1/\(id)"
        }
    }
    
    // MARK: - Method
    public var method: Moya.Method {
        switch self {
        case .example, .exampleWith:
            return .get
        case .create:
            return .post
        case .deleteExample:
            return .delete
        case .update:
            return .put
        }
    }
    
    // MARK: - Parameters
    public var parameters: [String: Any]? {
        switch self {
        case .example:
            return [
                "page": 0,
                "size": Constants.Service.defaultPageSize!
            ]
        case .deleteExample:
            return nil
        case .exampleWith(_, let params):
            let dict = params as? [String: Any]
            let values = dict!["params"] as? [String: Any]
            return ["param1": values!["param1"]!,
                    "param2": values!["param2"]!,
                    "param3": values!["param3"]!]
        case .create(let example):
            return example
        case .update(let example):
            return example
        }
    }
    // MARK: - Encoding
    public var parameterEncoding: ParameterEncoding {
        switch self {
        case .example, .deleteExample, .exampleWith:
            return URLEncoding.default
        case .create, .update:
            return JSONEncoding.default
        }
    }
    
    // MARK: - SampleData
    public var sampleData: Data {
        switch self {
        case .example, .exampleWith, .create, .deleteExample, .update:
            return Data()
        }
    }
    
    // MARK: - Task
    public var task: Task {
        switch self {
        case .example:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .exampleWith, .deleteExample:
            return .requestPlain
        case .update(let example):
            return .requestParameters(parameters: example, encoding: JSONEncoding.default)
        case .create(let example):
            return .requestParameters(parameters: example, encoding: JSONEncoding.default)
        }
    }
    
    public var multipartBody: [Moya.MultipartFormData]? {
        return nil
    }
    
    public var headers: [String: String]? {
        return nil
    }
}

