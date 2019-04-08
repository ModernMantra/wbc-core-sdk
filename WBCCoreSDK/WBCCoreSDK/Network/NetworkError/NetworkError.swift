//
//  ErrorMessage.swift
//  WBCCoreSDK
//
//  Created by Wetek on 02/04/2019.
//  Copyright © 2019 Waves Provider. All rights reserved.
//

import Foundation

public enum httpStatusCodes {
    case redirections
    case client
    case server
    case unknown
}

public class NetworkError: Error {
  
    public var statusCode: httpStatusCodes = .unknown
    
    
    public var apiResponseMessage: String?
    

    public var message: String {
        switch statusCode {
        case .redirections:
            return "Redirection error"
        case .client:
            return "Client error"
        case .server:
            return "Server error"
        case .unknown:
             return "Unknown"
        }
    }

    convenience init? (code: Int, responseMessage: String? = nil){
        self.init()
        self.apiResponseMessage = responseMessage
        switch code {
        case 300 ..< 400:
             self.statusCode = .redirections
        case 400 ..< 500:
             self.statusCode = .client
        case 500 ..< 600:
             self.statusCode = .server
        default:
            return nil
        }
    }
}
