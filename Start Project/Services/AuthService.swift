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
import Moya
import KeychainSwift

class AuthService {
    
    static let shared = AuthService()
    
    let provider = MoyaProvider<NetworkApi>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    let keychain = KeychainSwift()
//    var userResource: BehaviorRelay<ApiResource<UserResponse>> = BehaviorRelay<ApiResource<UserResponse>>(value: ApiResource(status: .none))
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
    
//    func login(userRequest: UserRequest){
//        self.provider.request(.login(userRequest: userRequest)) { [weak self] result in
//            switch result{
//            case .success(let response):
//                let userResponse = try? response.map(to: UserResponse.self)
//                if userResponse?.user != nil {
//                    self?.keychain.set((userResponse!.token)!, forKey: TOKEN)
//                    self?.token = userResponse!.token ?? ""
//                    self?.userResource.accept(ApiResource(status: .success, data: userResponse!))
//                }
//                else{
//                    let decoder = JSONDecoder()
//                    do {
//                        let apiErrors = try decoder.decode(ApiErrorResponse.self, from: response.data)
//                        self?.userResource.accept(ApiResource(status: .generalError, error: apiErrors.errors[0].errorCode!))
//                    } catch _ {
//                        self?.userResource.accept(ApiResource(status: .generalError, error: "general_error"))
//                    }
//                }
//            case .failure(let error):
//                self?.userResource.accept(ViewModel.handleError(errorData: error))
//            }
//        }
//    }
    
    //    func refreshToken(){
    //        self.provider.request(.refresh) { [weak self] result in
    //            switch result{
    //            case .success(let response):
    //                let user = try? response.map(to: UserResponse.self)
    //                self?.keychain.set(user?.token ?? "", forKey: TOKEN)
    //                self?.token = user?.token ?? ""
    //            case .failure(let error):
    //                self?.userResource.accept(ViewModel.handleError(errorData: error))
    //            }
    //        }
    //    }
}

let KEEP_LOGGED_IN = "keep_user"
let TOKEN = "token"
