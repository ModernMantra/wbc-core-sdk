//
//  ErrorMessage.swift
//  WBCCoreSDK
//
//  Created by Wetek on 02/04/2019.
//  Copyright © 2019 Waves Provider. All rights reserved.
//

import Foundation

public enum httpStatusCodes {
    case success
    case redirections
    case clint
    case server
    case unknown
}

public class NetworkError: Error {

    public var statusCode: httpStatusCodes = .unknown
    public var message: String {
        switch statusCode {
        case .success:
            return "Succuess"
        case .redirections:
            return "Redirection error"
        case .clint:
            return "Client error"
        case .server:
            return "Server error"
        case .unknown:
             return "Unknown"
        }
    }
   
    
    convenience init (code: Int){
        self.init()
        switch code {
        case 200 ..< 300:
             self.statusCode = .success
        case 300 ..< 400:
             self.statusCode = .redirections
        case 400 ..< 500:
             self.statusCode = .clint
        default:
             self.statusCode = .server
        
        }
    }
}
