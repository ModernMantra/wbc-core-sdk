//
//  CityEndPoints.swift
//  WBCCoreSDK
//
//  Created by Wetek on 01/04/2019.
//  Copyright © 2019 Waves Provider. All rights reserved.
//

import Foundation

public enum CityEndPoints {
    
    
    case cities(token: String, limit: Int?, order: String?, direction: String?)
    case cityByID(token: String, id: String)
    
    
}

extension CityEndPoints: Endpoint {
    public var baseURL: String {
        return "http://wbcmanage-dev.wecast.tv/v1"
    }
    
    // Set up the paths
    public var path: String {
        switch self {
        
        case .cityByID(let id):
            return "/cities/{id}"
 
        case .cities(_, let limit, let order, let direction):
            var path: String = "/cities"
            
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
        }
    }
    
    // Set up the methods
    public var method: HTTPMethods {
        switch self {
        
        case .cityByID(_),
             .cities:
            return .get
        }
    }
    
    
    public var headers: HTTPHeaders {
        switch self {
        case .cityByID(let token, let id):
            return ["Authorization" : "Baerer \(token)"]
        case .cities(let token, let limit, let order, let direction):
            return ["Authorization" : "Baerer \(token)"]
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
