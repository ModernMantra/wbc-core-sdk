//
//  Endpoint.swift
//  WBCCoreSDK
//
//  Created by Wetek on 01/04/2019.
//  Copyright © 2019 Waves Provider. All rights reserved.
//

import Foundation
import Alamofire

public protocol Endpoint {
    
    // https://example.com
    var baseURL: String { get }
    
    var path: String { get } // /users/
    
    var fullURL: String { get } // This will automatically be set
    
    var method: HTTPMethods { get } // .get
    
    var body: Parameters { get }
    
    var headers: HTTPHeaders { get } // dictionary
    
    var encoding: ParameterEncoding { get }
}

public extension Endpoint {
    
    var encoding: ParameterEncoding {
        return self.method == .get ? URLEncoding.default : JSONEncoding.default
    }
    // Should always be the same no matter what
    var fullURL: String {
        return baseURL + path
    }
    
    // A lot of requests don't require parameters
    // so we just set them to be empty
    var body: Parameters {
        return Parameters()
    }
    
}
