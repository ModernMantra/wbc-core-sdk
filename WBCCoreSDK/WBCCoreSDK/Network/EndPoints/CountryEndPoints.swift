//
//  CountryEndPoints.swift
//  WBCCoreSDK
//
//  Created by Wetek on 01/04/2019.
//  Copyright © 2019 Waves Provider. All rights reserved.
//

import Foundation



public enum CountryEndPoints {

    case countries(token: String, limit: Int?, order: String?, direction: String?)
    case countryByID(token: String, id: String)
    
    
}

extension CountryEndPoints: Endpoint {
    public var baseURL: String {
        return "http://wbcmanage-dev.wecast.tv/v1"
    }
    
    // Set up the paths
    public var path: String {
        switch self {
    
            
        case .countries(_, let limit, let order, let direction):
            var path: String = "/countries"
            
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
            
        case .countryByID(let id):
            return "/countries/{id}"
            
        }
    }
    
    // Set up the methods
    public var method: HTTPMethods {
        switch self {
        case .countries,
             .countryByID(_):
            return .get
        }
    }
    
    
    public var headers: HTTPHeaders {
        switch self {
       
        case .countries(let token, let limit, let order, let direction):
            return ["Authorization" : "Baerer \(token)"]
        case .countryByID(let token, let id):
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
