//
//  ViewModel.swift
//  xCoordinatorsTest
//
//  Created by Ljubo Maricevic on 18/02/2019.
//  Copyright © 2019 Ljubo Maricevic. All rights reserved.
//

import Foundation
import Moya
import RxSwift

open class ViewModel {
    
    static func handleError<T>(errorData: MoyaError) -> ApiResource<T>{
        switch errorData {
        case .underlying(let error, let response):
            if response == nil {
                return ApiResource(status: .generalError, error: error.localizedDescription)
            } else {
                let decoder = JSONDecoder()
                do {
                    let apiErrors = try decoder.decode(ApiErrorResponse.self, from: response!.data)
                    return ApiResource(status: .generalError, error: apiErrors.errors != nil ? apiErrors.errors[0].errorCode! : "")
                } catch _ {
                    // TODO
                    return ApiResource(status: .generalError, error: "general_error")
                }
            }
        default:
            return ApiResource(status: .generalError, error: "general_error")
        }
    }    
}
