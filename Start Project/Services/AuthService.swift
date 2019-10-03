//
//  AuthService.swift
//  onepower-ios
//
//  Created by Ljubo Maricevic on 11/07/2019.
//  Copyright © 2019 Ljubo Maricevic. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import KeychainSwift
import Moya

class AuthService {
    
    static let shared = AuthService()
    
    let provider = MoyaProvider<NetworkApi>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    let keychain = KeychainSwift()
    var keepLoggedIn: Bool {
        get { return keychain.getBool(KEEP_LOGGED_IN) ?? false }
        set { keychain.set(newValue, forKey: KEEP_LOGGED_IN) }
    }
    
    var token: String {
        get {
            if mToken.isEmpty { mToken = keychain.get(TOKEN) ?? "" }
            return mToken
        }
        set {
            mToken = newValue
            keychain.set(newValue, forKey: TOKEN)
        }
    }
    
    private var mToken: String = ""
    private init() {}
    
    func refreshToken(){
            
    }

}
