//
//  ActiveOperatorsAdministratorsEndPoint.swift
//  WBCCoreSDK
//
//  Created by Wetek on 04/04/2019.
//  Copyright © 2019 Waves Provider. All rights reserved.
//

import Foundation


public enum ActiveOperatorsAdminEndPoint{
    case operatorsAdmin(limit: Int?, order: String?, direction: String?)
    case operatorsAdminByID(id: String)
}

extension ActiveOperatorsAdminEndPoint: Endpoint {
    // Set up the paths
    public var path: String {
        switch self {
        case .operatorsAdmin(let limit, let order, let direction):
            var path: String = "/operator-administrators"
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
        case .operatorsAdminByID(let id):
            return "/operator-administrators/\(id)"
        }
    }
    
    // Set up the methods
    public var method: HTTPMethods {
        switch self {
        case .operatorsAdmin,
             .operatorsAdminByID(_):
            return .get
        }
    }
    
    
    public var headers: HTTPHeaders {
        switch self {
            
        case .operatorsAdmin(_, _, _),
             .operatorsAdminByID(_):
            return ["accept" : "application/json"]
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

