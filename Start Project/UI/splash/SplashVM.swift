//
//  SplashVM.swift
//  onepower-ios
//
//  Created Ljubo Maricevic on 11/07/2019.
//  Copyright © 2019 Ljubo Maricevic. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Moya
import KeychainSwift
import XCoordinator

class SplashVM: ViewModel {

    var router: AnyRouter<AppRoute>!
  
    private var provider: MoyaProvider<NetworkApi>!
    let offersResource:BehaviorRelay<ApiResource<[Offer]>> = BehaviorRelay<ApiResource<[Offer]>>(value: ApiResource(status: .none))

    
    init(provider: MoyaProvider<NetworkApi>) {
        self.provider = provider
    }
    
    func getOffers(lang: String){
        self.provider.request(.getOffers(lang: lang)) {[weak self] (result) in
            switch result{
            case .success(let response):
                let offers = try! response.map(to: [Offer].self)
                self?.offersResource.accept(ApiResource(status: .success, data: offers))
            case .failure(let error):
                self?.offersResource.accept(ViewModel.handleError(errorData: error))
            }
        }
    }
    
    func exitSplash(offers: [Offer]){
//        self.router.trigger(.main(offers: offers))
    }
  
}
