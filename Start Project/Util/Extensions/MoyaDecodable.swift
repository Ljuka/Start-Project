//
//  MoyaDecodable.swift
//  BaseProject
//
//  Created by User on 05/03/2019.
//  Copyright © 2019 NV. All rights reserved.
//

import Foundation
import Moya

extension Moya.Response {
    
    public func map<T>(to type: T.Type, using decoder: JSONDecoder = JSONDecoder()) throws -> T where T: Swift.Decodable {
        let decoder = decoder
        return try decoder.decode(type, from: data)
    }
    
}
