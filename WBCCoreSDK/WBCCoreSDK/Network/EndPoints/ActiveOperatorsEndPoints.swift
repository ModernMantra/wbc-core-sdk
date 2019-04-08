//
//  ActiveOperatorsEndPoint.swift
//  WBCCoreSDK
//
//  Created by Wetek on 04/04/2019.
//  Copyright © 2019 Waves Provider. All rights reserved.
//

import Foundation


public enum ActiveOperatorsEndPoint{
    case operators(token: String, limit: Int?, order: String?, direction: String?)
    case operatorsByID(token: String, id: String)
}

extension ActiveOperatorsEndPoint: Endpoint {
    // Set up the paths
    public var path: String {
        switch self {
        case .operators(_, let limit, let order, let direction):
            var path: String = "/operators"
            
            if let limit = limit {
                path = "?\(limit)"
            }
            if let order = order {
                path += "&order=\(order)"
            }
            if let direction = direction {
                path += "&direction=\(direction)"
            }
            return path
        case .operatorsByID(let id):
            return "/operators/\(id)"
        }
    }
    
    // Set up the methods
    public var method: HTTPMethods {
        switch self {
        case .operators,
             .operatorsByID(_):
            return .get
        }
    }
    
    
    public var headers: HTTPHeaders {
        switch self {
        case .operators(let token, _, _, _),
             .operatorsByID(let token, _):
            return [ "accept" : "application/json",
                     "Authorization" : "Bearer \(token)"]
        }
    }
    public var body: Parameters {
        var body: Parameters = Parameters()
        switch self {
            
        default:
            break
        }
        return body
    }
}
