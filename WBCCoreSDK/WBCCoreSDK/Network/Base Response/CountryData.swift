//
//  CountryData.swift
//  WBCCoreSDK
//
//  Created by Wetek on 04/04/2019.
//  Copyright © 2019 Waves Provider. All rights reserved.
//

import Foundation
import ObjectMapper

public class CountryData: Mappable {
    
    var id: Int?
    var name: String?
    var code: String?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id     <- map["id"]
        name   <- map["name"]
        code  <- map["code"]
        
}

}
