//
//  ActivityLogEndPoints.swift
//  WBCCoreSDK
//
//  Created by Wetek on 04/04/2019.
//  Copyright © 2019 Waves Provider. All rights reserved.
//

import Foundation


public enum ActivityLogEndPoint{
    case statisticsDashboard
}

extension ActivityLogEndPoint: Endpoint {
    // Set up the paths
    public var path: String {
        switch self {
        case .statisticsDashboard:
            return "/statistics/dashboard"
        }
    }
    
    // Set up the methods
    public var method: HTTPMethods {
        switch self {
        case .statisticsDashboard:
            return .get
        }
    }
    
    public var headers: HTTPHeaders {
        switch self {
        case .statisticsDashboard:
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

