//
//  File.swift
//  
//
//  Created by Jinu on 24/01/2024.
//

// URLSessionDataTaskMock.swift
import Foundation

// URLSessionDataTaskMock for testing
class URLSessionDataTaskMock: URLSessionDataTask {
    var completionHandler: (() -> Void)?

    override func resume() {
        completionHandler?()
    }
}
