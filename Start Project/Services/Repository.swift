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
    
    init(){
        let helper = AccessTokenHelper()
        
        provider.manager.adapter = helper
        provider.manager.retrier = helper
    }
    
}
