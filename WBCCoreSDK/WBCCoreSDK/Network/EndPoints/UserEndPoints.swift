//
//  UserEndPoints.swift
//  WBCCoreSDK
//
//  Created by Wetek on 01/04/2019.
//  Copyright © 2019 Waves Provider. All rights reserved.
//

import Foundation
import Alamofire


enum UserEndpoints {
    
    //Method for authentication (login)
    case login(username: String, password: String)
    
    //Method for logout
    case logout
    
    //Method for retrieving forgotten password
    case forgot(email: String)
    
}

extension UserEndpoints: Endpoint {

    // Set up the paths
    var path: String {
        switch self {
        case .login(_, _):
            return "/auth/login"
        case .logout:
            return "/auth/logout"
        case .forgot:
            return "/auth/password/forgot"
        }
    }
    
    // Set up the methods
    var method: HTTPMethods {
        switch self {
        case .login(_, _):
            return .post
        case .logout:
            return .get
        case .forgot:
            return .put
        }
    }

    var headers: HTTPHeaders {
        switch self {
        case .login(let username, let password):
            let loginString = String(format: "%@:%@", username, password)
            let loginData = loginString.data(using: String.Encoding.utf8)!
            let base64LoginString = loginData.base64EncodedString()
            let header = "Basic \(base64LoginString)"
            return ["Authorization" : header]
        case .forgot(_):
            return [
                "accept" : "application/json",
                "Content-Type" : "application/x-www-form-urlencoded"
            ]
        case .logout:
            return ["accept" : "application/json"]
        }
        
    }
    
    var body: Parameters {
        var body: Parameters = Parameters()
        switch self {
        case .forgot(let email):
            body["email"] = email

        default:
            break
        }
        return body
    }
    
}
