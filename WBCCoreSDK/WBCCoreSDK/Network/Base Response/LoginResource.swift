//
//  BaseResponseResource.swift
//  WBCCoreSDK
//
//  Created by Wetek on 02/04/2019.
//  Copyright © 2019 Waves Provider. All rights reserved.
//

import Foundation
import ObjectMapper

public class LoginResource: Mappable {
    
    var refresh_token: String?
    var access_token: String?
    var key: String?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        refresh_token     <- map["refresh_token"]
        access_token   <- map["access_token"]
        key  <- map["key"]
    }
}
