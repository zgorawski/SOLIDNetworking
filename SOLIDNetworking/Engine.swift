//
//  Engine.swift
//  SOLIDNetworking
//
//  Created by Zbigniew Górawski on 16/04/2017.
//  Copyright © 2017 Zbigniew Górawski. All rights reserved.
//

import Alamofire

public typealias IsRequestValid = Bool

open class NetworkingEngine {
    
    private let alamofireSessionManager: SessionManager
    
    public init(configuration: URLSessionConfiguration = URLSessionConfiguration.default) {
        alamofireSessionManager = SessionManager(configuration: configuration)
    }
    
    // MARK: API
    
    @discardableResult
    public func performRequest<Req: Request>(request: Req, handler: @escaping (Result<Req.InterpreterType.SuccessType, Req.InterpreterType.ErrorType>) -> Void ) -> IsRequestValid  {
        
        guard let url = computeURL(request) else { return false }
        
        let afRequest = alamofireSessionManager.request(url, method: request.httpMethod, parameters: request.parameters, encoding: request.parameterEncoding, headers: request.headers)
        
        afRequest.responseData { response in
            
            let interpretedResponse = request.interpreter.interpret(data: response.data, response: response.response, error: response.error)
            
            DispatchQueue.main.async { handler(interpretedResponse) }
        }
        
        return true
    }
    
    // MARK: private
    
    private func computeURL<Req: Request>(_ request: Req) -> URL? {
        
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = request.host
        urlComponents.path = request.endpoint
        
        return urlComponents.url
    }
}
