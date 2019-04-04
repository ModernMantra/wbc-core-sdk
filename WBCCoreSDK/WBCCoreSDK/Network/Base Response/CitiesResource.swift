//
//  CitiesResource.swift
//  WBCCoreSDK
//
//  Created by Wetek on 04/04/2019.
//  Copyright © 2019 Waves Provider. All rights reserved.
//

import Foundation
import ObjectMapper

public class CitiesResource: Mappable {
    
    var current_page: Int?
    var last_page: Int?
    var per_page: Int?
    var total: Int?
    
    var first_page_url: String?
    var last_page_url: String?
    var next_page_url: String?
    var prev_page_url: String?
    
    var data: [CitiesData]?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        current_page     <- map["current_page"]
        first_page_url   <- map["first_page_url"]
        last_page  <- map["last_page"]
        last_page_url   <- map["last_page_url"]
        next_page_url   <- map["next_page_url"]
        per_page   <- map["per_page"]
        prev_page_url   <- map["prev_page_url"]
        total   <- map["total"]
        data   <- map["data"]
        
    }
}
