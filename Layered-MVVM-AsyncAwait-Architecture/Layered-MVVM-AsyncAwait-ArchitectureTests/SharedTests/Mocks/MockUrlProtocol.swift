//
//  MockUrlProtocol.swift
//  PhotoAppTests
//
//  Created by Jinu on 15/01/2024.
//

import Foundation

class MockUrlProtocol: URLProtocol {
    static var stubResponseData: Data?
    static var error: Error?
    
    override class func canInit(
        with request: URLRequest
    ) -> Bool {
        true
    }
    override class func canonicalRequest(
        for request: URLRequest
    ) -> URLRequest {
        request
    }
    override func startLoading() {
        if let signupError = MockUrlProtocol.error {
            self.client?.urlProtocol(
                self,
                didFailWithError: signupError
            )
        } else {
            self.client?.urlProtocol(
                self,
                didLoad: MockUrlProtocol.stubResponseData ?? Data()
            )
            
        }
        self.client?.urlProtocolDidFinishLoading(
            self
        )
    }
    override func stopLoading() {
        
    }
}
