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
import XCoordinator

class SplashVM: ViewModel {

    var router: AnyRouter<AppRoute>!
  
    private var provider: MoyaProvider<NetworkApi>!
    
    init(provider: MoyaProvider<NetworkApi>) {
        self.provider = provider
    }
    
    func exitSplash(){
        print("Splash screen ended")
//        self.router.trigger(.main)
    }
  
}
