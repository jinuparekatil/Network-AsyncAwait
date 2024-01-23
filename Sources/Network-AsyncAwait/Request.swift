//
//  File.swift
//  
//
//  Created by Jinu on 23/01/2024.
//

import Foundation

public protocol Request {
    
    init(baseURL: URL, path: String)
    
    @discardableResult
    func set(method: HTTPMethod) -> Self
    
    @discardableResult
    func set(path: String) -> Self
    
    @discardableResult
    func set(headers: [String : String]?) -> Self
    
    @discardableResult
    func set(parameters: APIRequestParameters?) -> Self
    
    func build() throws -> URLRequest
    
}
