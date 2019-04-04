//
//  Network.swift
//  WBCCoreSDK
//
//  Created by Wetek on 01/04/2019.
//  Copyright © 2019 Waves Provider. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

public struct Network<T: Mappable> {
    
    
    public func sendRequest(endpoint: Endpoint, completion: @escaping (NetworkError?, T?) -> Void) {
        var httpMethod: Alamofire.HTTPMethod
        switch endpoint.method{
        case .get:
            httpMethod = Alamofire.HTTPMethod.get
        case .options:
            httpMethod = Alamofire.HTTPMethod.options
        case .head:
            httpMethod = Alamofire.HTTPMethod.head
        case .post:
            httpMethod = Alamofire.HTTPMethod.post
        case .put:
            httpMethod = Alamofire.HTTPMethod.put
        case .patch:
            httpMethod = Alamofire.HTTPMethod.patch
        case .delete:
            httpMethod = Alamofire.HTTPMethod.delete
        case .trace:
            httpMethod = Alamofire.HTTPMethod.trace
        case .connect:
            httpMethod = Alamofire.HTTPMethod.connect
        }
        
        Alamofire.request(endpoint.fullURL, method: httpMethod, parameters: endpoint.body, encoding: endpoint.encoding, headers: endpoint.headers).responseJSON { response in
            let networkError = NetworkError(code: response.response?.statusCode ?? -1)
            let baseResponse = Mapper<BaseResponse<LoginResource>>().map(JSONObject: response.result.value)
        }
    }
}
