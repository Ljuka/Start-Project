//
//  Moya.swift
//  onepower-ios
//
//  Created by Ljubo Maricevic on 11/07/2019.
//  Copyright © 2019 Ljubo Maricevic. All rights reserved.
//

import Foundation
import Moya
import KeychainSwift

let keychain = KeychainSwift()

enum NetworkApi{
    case networkApi
}

#if ENV_STAGING
let BASE_URL = "https://staging.example.com"
#else
let BASE_URL = "https://example.com"
#endif

extension NetworkApi: TargetType{
    
    var sampleData: Data {
        return Data()
    }
    
    var baseURL: URL {
        switch self {
        default:
            return URL(string: BASE_URL)!
        }
    }
    
    var path: String {
        switch self {
        case .networkApi:
            return "/test"
        }
    }
    
    var validationType: ValidationType {
        switch self {
        default:
            return .successCodes
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .networkApi:
            return .requestParameters(parameters: ["key" : "value"], encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

enum ApiStatus {
    case none
    case loading
    case success
    case generalError
}
