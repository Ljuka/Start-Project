//
//  AppCoordinator.swift
//  onepower-ios
//
//  Created by Ljubo Maricevic on 11/07/2019.
//  Copyright © 2019 Ljubo Maricevic. All rights reserved.
//

import Foundation
import XCoordinator
import Moya

enum AppRoute: Route{
    case splash
//    case main(offers: [Offer])
}

class AppCoordinator: NavigationCoordinator<AppRoute> {
    
    let provider = MoyaProvider<NetworkApi>()
    
    init(route: AppRoute = .splash){
        super.init(initialRoute: route)
        let helper = AccessTokenHelper()
        
        provider.manager.adapter = helper
        provider.manager.retrier = helper
        
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        let animation = Animation(presentation: InteractiveTransitionAnimation.push, dismissal: InteractiveTransitionAnimation.pop)
        switch route {
        case .splash:
            let splashVC = SplashVC.instantiateFromNib()
            let viewModel: SplashVM = SplashVM(provider: provider)
            splashVC.bind(to: viewModel)
            viewModel.router = anyRouter
            return .present(splashVC)
//        case .main(let offers):
//            let main = MainCoordinator(provider, offers: offers)
//            return .present(main, animation: animation)

        }
    }
    
}
