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
    case getOffers(lang: String)
}

#if ENV_STAGING
let BASE_URL = "https://onepowerapi.baket.it"
#else
let BASE_URL = "https://onepowerapi.baket.it"
#endif

extension NetworkApi: TargetType{
    
    var sampleData: Data {
        return Data()
    }
    
    var baseURL: URL {
        switch self {
//        case .getLatLongFromGoogle(_), .reverseGeocoding(_):
//            return URL(string: "https://maps.googleapis.com")!
        default:
            return URL(string: BASE_URL)!
        }
    }
    
    var path: String {
        switch self {
        case .getOffers(_):
            return "/offers"
        }
    }
    
    var validationType: ValidationType {
        switch self {
//        case .login(_):
//            return .none
        default:
            return .successCodes
        }
    }
    
    var method: Moya.Method {
        switch self {
//        case .uploadImageOffer(_), .insertOffer(_,_,_,_,_,_,_,_,_,_,_), .register, .uploadRegistrationImage(_,_):
//            return .post
//        case .acceptTransaction(_), .denyTransaction(_), .editOffer(_,_,_,_,_,_,_,_,_,_,_,_):
//            return .put
//        case .deleteOffer(_):
//            return .delete
        default:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getOffers(let lang):
            return .requestParameters(parameters: ["lang" : lang], encoding: URLEncoding.default)
            
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
