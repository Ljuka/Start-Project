//
//  ErrorResponse.swift
//  xCoordinatorsTest
//
//  Created by Ljubo Maricevic on 18/02/2019.
//  Copyright © 2019 Ljubo Maricevic. All rights reserved.
//

import Foundation

struct ApiErrorResponse: Codable {
    let errors: [ApiError]!
    
    private enum CodingKeys: String, CodingKey {
        case errors
    }
}

struct ApiError: Codable {
    let errorCode: String?
    let message: String?
    
    private enum CodingKeys: String, CodingKey {
        case errorCode = "error_code"
        case message
    }
}
