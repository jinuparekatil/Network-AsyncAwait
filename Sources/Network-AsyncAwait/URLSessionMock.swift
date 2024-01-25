//
//  File.swift
//  
//
//  Created by Jinu on 24/01/2024.
//

// URLSessionMock.swift
import Foundation

// URLSessionMock for testing
class URLSessionMock: URLSessionProtocol {
    var data: Data?
    var response: URLResponse?
    var error: Error?

    func dataTask(
        with request: URLRequest,
        completionHandler: @escaping DataTaskResult
    ) -> URLSessionDataTask {
        let task = URLSessionDataTaskMock()
        task.completionHandler = { [weak self] in
            completionHandler(self?.data, self?.response, self?.error)
        }
        return task
    }
}
