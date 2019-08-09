//
//  Repository.swift
//  onepower-ios
//
//  Created by Ljubo Maricevic on 11/07/2019.
//  Copyright © 2019 Ljubo Maricevic. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Moya

class Repository {
    
    static let shared = Repository()
    
    let provider = MoyaProvider<NetworkApi>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    let order: BehaviorRelay<ApiResource<Order>> = BehaviorRelay<ApiResource<Order>>(value: ApiResource(status: .none))
//    let user: BehaviorRelay<ApiResource<User>> = BehaviorRelay<ApiResource<User>>(value: ApiResource(status: .none))
//    var selectedShopCode: BehaviorRelay<String> = BehaviorRelay<String>(value: "")
//    var didGoToShopRegister: BehaviorRelay<Bool> = BehaviorRelay<Bool >(value: false)
    
    init(){
        let helper = AccessTokenHelper()
        
        provider.manager.adapter = helper
        provider.manager.retrier = helper
    }
    
//    func getShop(code: String){
//        self.provider.request(.getShop(code: code)) { [weak self] result in
//            switch result{
//            case .success(let response):
//                let selectedShop = try! response.map(to: Shop.self)
//                self?.selectedShop.accept(ApiResource(status: .success, data: selectedShop))
//            case .failure(let error):
//                self?.selectedShop.accept(ViewModel.handleError(errorData: error))
//            }
//        }
//    }
//    
//    func refreshUser(){
//        provider.request(.getUser) { result in
//            switch result{
//            case .success(let response):
//                let user = try! response.map(to: User.self)
//                self.user.accept(ApiResource<User>(status: .success, data: user))
//            case .failure(let error):
//                self.user.accept(ViewModel.handleError(errorData: error))
//                break
//            }
//        }
//    }
//    
//    func refreshSelectedShop(){
//        provider.request(.getUser) { result in
//            switch result{
//            case .success(let response):
//                let user = try! response.map(to: User.self)
//                if self.selectedShopCode.value == ""{
//                    if (user.shop_permissions?.count)! > 0{
//                        Repository.shared.getShop(code: (user.shop_permissions?.first?.shop!.code)!)
//                    }
//                    else{
//                        self.selectedShop.accept(ApiResource<Shop>(status: .none))
//                    }
//                }
//                else{
//                    Repository.shared.getShop(code: self.selectedShopCode.value)
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//                //TO DO
//                break
//            }
//        }
//    }
}
