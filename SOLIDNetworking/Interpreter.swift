//
//  Interpreter.swift
//  SOLIDNetworking
//
//  Created by Zbigniew Górawski on 16/04/2017.
//  Copyright © 2017 Zbigniew Górawski. All rights reserved.
//

public protocol Interpreter {
    
    associatedtype SuccessType
    associatedtype ErrorType: Error
    
    func interpret(data: Data?, response: HTTPURLResponse?, error: Error?) -> Result<SuccessType, ErrorType>
}
