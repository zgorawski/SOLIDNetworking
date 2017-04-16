//
//  Result.swift
//  SOLIDNetworking
//
//  Created by Zbigniew Górawski on 16/04/2017.
//  Copyright © 2017 Zbigniew Górawski. All rights reserved.
//

public enum Result<T, E: Error> {
    
    case success(T)
    case error(E)
}
