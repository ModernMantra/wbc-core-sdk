//
//  ActiveSystemUserEndPoint.swift
//  WBCCoreSDK
//
//  Created by Wetek on 04/04/2019.
//  Copyright © 2019 Waves Provider. All rights reserved.
//

import Foundation


public enum SystemUserEndPoint{
    case systemUser(token: String, limit: Int?, order: String?, direction: String?)
    case systemUserByID(token: String, id: String)
}

extension SystemUserEndPoint: Endpoint {
    // Set up the paths
    public var path: String {
        switch self {
        case .systemUser(_, let limit, let order, let direction):
            var path: String = "/system-users"
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
        case .systemUserByID(let id):
            return "/system-users/\(id)"
        }
    }
    
    // Set up the methods
    public var method: HTTPMethods {
        switch self {
        case .systemUser,
             .systemUserByID(_):
            return .get
        }
    }
    
    
    public var headers: HTTPHeaders {
        switch self {
        case .systemUser(let token, _, _, _),
             .systemUserByID(let token, _):
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
