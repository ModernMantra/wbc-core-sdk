//
//  CitiesData.swift
//  WBCCoreSDK
//
//  Created by Wetek on 04/04/2019.
//  Copyright © 2019 Waves Provider. All rights reserved.
//

import Foundation
import ObjectMapper

public class CitiesData: Mappable {
    
    var id: Int?
    var name: String?
    var country_code: String?
    var latitude: Double?
    var longitude: Double?
    
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id     <- map["id"]
        name   <- map["name"]
        country_code  <- map["country_code"]
        latitude  <- map["latitude"]
        longitude  <- map["longitude"]
       
        
    }
}
