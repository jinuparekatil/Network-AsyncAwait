//
//  File.swift
//  
//
//  Created by Jinu on 24/01/2024.
//

// URLSessionProtocol.swift
import Foundation

// Protocol for a mock URL session
protocol URLSessionProtocol {
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
    func dataTask(
        with request: URLRequest,
        completionHandler: @escaping DataTaskResult
    ) -> URLSessionDataTask
}
