//
//  AcessTokenAdapter.swift
//  TokenRefreshTest
//
//  Created by User on 17/04/2019.
//  Copyright © 2019 NV. All rights reserved.
//

import Foundation
import Alamofire

class AccessTokenHelper: RequestAdapter, RequestRetrier {
    
    private typealias RefreshCompletion = (_ succeeded: Bool, _ accessToken: String?) -> Void
    private let lock = NSLock()
    private var requestsToRetry: [RequestRetryCompletion] = []
    private var isRefreshing = false
    private let sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        
        return SessionManager(configuration: configuration)
    }()
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        
        // Don't add accessToken just for login and egister
        if let urlString = urlRequest.url?.absoluteString, !urlString.contains("login") && !urlString.contains("login"){
            urlRequest.setValue("Bearer " + AuthService.shared.token, forHTTPHeaderField: "Authorization")
        }
        
        return urlRequest
    }
    
    func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        lock.lock() ; defer { lock.unlock() }
        
        if let response = request.task?.response as? HTTPURLResponse, response.statusCode == 403 {
            requestsToRetry.append(completion)
            
            if !isRefreshing {
                refreshTokens { [weak self] succeeded, accessToken in
                    guard let strongSelf = self else { return }
                    
                    strongSelf.lock.lock() ; defer { strongSelf.lock.unlock() }
                    
                    if let accessToken = accessToken {
                        AuthService.shared.token = accessToken
                    }
                    
                    strongSelf.requestsToRetry.forEach { $0(succeeded, 0.0) }
                    strongSelf.requestsToRetry.removeAll()
                }
            }
        } else {
            completion(false, 0.0)
        }
    }
    
    private func refreshTokens(completion: @escaping RefreshCompletion) {
        guard !isRefreshing else { return }
        
        isRefreshing = true
        
        let urlString = "\(BASE_URL)/refresh"
        
        let headers: [String: Any] = [
            "Authorization": "Bearer " + AuthService.shared.token
        ]
        
        sessionManager.request(urlString, method: .get, encoding: JSONEncoding.default, headers: headers as? HTTPHeaders)
            .responseJSON { [weak self] response in
                guard let strongSelf = self else { return }
                if
                    let json = response.result.value as? [String: Any],
                    let accessToken = json["token"] as? String
                {
                    completion(true, accessToken)
                } else {
                    completion(false, nil)
                }
                
                strongSelf.isRefreshing = false
        }
    }
}
