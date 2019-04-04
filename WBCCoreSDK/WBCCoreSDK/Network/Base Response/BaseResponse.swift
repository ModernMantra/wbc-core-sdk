//
//  BaseResponse.swift
//  WBCCoreSDK
//
//  Created by Wetek on 02/04/2019.
//  Copyright © 2019 Waves Provider. All rights reserved.
//

import Foundation
import ObjectMapper

public class BaseResponse<T: Mappable>: Mappable {
    
    var error: String?
    var message: String?
    var resource: T?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        error     <- map["error"]
        message   <- map["message"]
        resource  <- map["resource"]
    }
    
}
