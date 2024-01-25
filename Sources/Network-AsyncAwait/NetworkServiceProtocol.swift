//
//  File.swift
//  
//
//  Created by Jinu on 24/01/2024.
//

// NetworkService.swift
import Foundation

public protocol NetworkProtocol {
    func fetchData<T: Decodable>(with builder: RequestBuilder) async throws -> T
    func performRequest<T: Decodable>(
        baseURL: URL,
        to endpoint: String,
        method: HTTPMethod,
        headers: [String: String],
        body: APIRequestParameters
    ) async throws -> T
}
