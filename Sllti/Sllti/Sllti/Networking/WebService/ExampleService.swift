//
//  ExampleService.swift
//  Sllti
//
//  Created by ameer on 5/19/18.
//  Copyright © 2018 Novent App. All rights reserved.
//


import Foundation
import Moya
import ObjectMapper

class ExampleService: BaseService {
    
    // MARK: - Public
    static let sharedInstance = ExampleService()
    
    // MARK: - Private
    private var ExampleEndpointClosure: (ExampleEndpoint) -> Endpoint<ExampleEndpoint>
    private var ExampleProvider: MoyaProvider<ExampleEndpoint>
    
    // MARK: - Setup
    override init() {
        ExampleEndpointClosure = { (target: ExampleEndpoint) -> Endpoint<ExampleEndpoint> in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            switch target {
            case .example, .exampleWith, .create, .deleteExample, .update:
                return defaultEndpoint.adding(newHTTPHeaderFields: ["Authorization": "Basic YWRtaW5AYm9vdC5jb206YWRtaW4="])
                //            default: return defaultEndpoint
            }
        }
        
        ExampleProvider = MoyaProvider<ExampleEndpoint>(endpointClosure: ExampleEndpointClosure, manager: AlamofireManager.sharedManager)
        super.init()
    }
    
    func getAllExamples(completion: @escaping ([Example]?, Swift.Error?)->()) {
        let endpoint = ExampleEndpoint.example
        request(endpoint: endpoint, provider: ExampleProvider) { (response: ExampleRwsponse?, error) in
            completion(response?.content, error)
        }
    }
    
    
    func getExampleWith(example: [String: Any], id: String, completion: @escaping (Example?, Swift.Error?)->()) {
        let endpoint = ExampleEndpoint.exampleWith(id: id, params: example)
        request(endpoint: endpoint, provider: ExampleProvider) { (response: Example?, error) in
            completion(response, error)
        }
    }
    
    
    
    func create(example: [String: Any], completion: @escaping (Example?, Swift.Error?)->()) {
        let endpoint = ExampleEndpoint.create(example: example)
        request(endpoint: endpoint, provider: ExampleProvider) { (response: Example?, error) in
            completion(response, error)
        }
    }
    
    func update(example: [String: Any], completion: @escaping (Bool, Swift.Error?)->()) {
        let endpoint = ExampleEndpoint.update(example: example)
        request(endpoint: endpoint, provider: ExampleProvider) { (success: Bool, error) in
            completion(success, error)
        }
        //        request(endpoint: endpoint, provider: ExampleProvider) { (response: BoolResponse?, error) in
        //            completion(response, error)
        //        }
    }
    
    func deleteExample(id: String, completion: @escaping (Example?, Swift.Error?)->()) {
        let endpoint = ExampleEndpoint.deleteExample(id: id)
        request(endpoint: endpoint, provider: ExampleProvider) { (response: Example?, error) in
            completion(response, error)
        }
    }
}
