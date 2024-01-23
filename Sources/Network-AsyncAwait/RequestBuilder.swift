//
//  RequestBuilder.swift
//  
//
//  Created by Jinu on 23/01/2024.
//

import Foundation
public class RequestBuilder: Request {
    private var baseURL: URL
    private var path: String
    private var method: HTTPMethod = .get
    private var headers: [String : String]?
    private var parameters: APIRequestParameters?
    
    public required init(baseURL: URL, path: String) {
        self.baseURL = baseURL
        self.path = path
    }
    
    public func set(method: HTTPMethod) -> Self {
        self.method = method
        return self
    }
    
    public func set(path: String) -> Self {
        self.path = path
        return self
    }
    
    public func set(headers: [String : String]?) -> Self {
        self.headers = headers
        return self
    }
    
    public func set(parameters: APIRequestParameters?) -> Self {
        self.parameters = parameters
        return self
    }
    
    public func build() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url,cachePolicy: .reloadRevalidatingCacheData,timeoutInterval: 50)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = headers
        setUpBody(urlRequest: &urlRequest)
        return urlRequest
    }
    private func setUpBody(urlRequest: inout URLRequest){
        if let parameters = parameters {
            switch parameters {
            case .body(let bodyParam):
                setupRequestBody(bodyParam, for: &urlRequest)
            case .url(let urlParam):
                setupRequestURLBody(urlParam, for: &urlRequest)
            }
            
        }
    }
    
    private func setupRequestBody(_ parameters: [String : Any]?, for request: inout URLRequest){
        if let parameters = parameters {
            let data = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            request.httpBody = data
        }
    }
    private func setupRequestURLBody(_ parameters: [String : String]?, for request: inout URLRequest){
        if let parameters = parameters,
           let url = request.url,
           var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true){
            urlComponents.queryItems = parameters.map{ URLQueryItem(name: $0.key, value: $0.value)}
            request.url = urlComponents.url
        }
    }
}
