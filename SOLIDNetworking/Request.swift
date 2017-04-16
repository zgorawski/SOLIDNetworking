//
//  Request.swift
//  SOLIDNetworking
//
//  Created by Zbigniew Górawski on 16/04/2017.
//  Copyright © 2017 Zbigniew Górawski. All rights reserved.
//

import Alamofire

public protocol Request {
    
    var httpMethod: HTTPMethod { get }
    var host: String { get }
    var endpoint: String { get }
    
    var parameters: Parameters? { get }
    var parameterEncoding: ParameterEncoding { get }
    var headers: HTTPHeaders? { get }
    
    associatedtype InterpreterType: Interpreter
    var interpreter: InterpreterType { get }
}
