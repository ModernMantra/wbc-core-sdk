//
//  OperatorAdminData.swift
//  WBCCoreSDK
//
//  Created by Wetek on 04/04/2019.
//  Copyright © 2019 Waves Provider. All rights reserved.
//

import Foundation
import ObjectMapper


public class OperatorAdminData: Mappable {
    
    var id: Int?
    var name: String?
    var email: String?
    var status: Int?
    var last_login: Int?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id     <- map["id"]
        name   <- map["name"]
        email  <- map["email"]
        status  <- map["status"]
        last_login  <- map["last_login"]
        
    }
    
}
