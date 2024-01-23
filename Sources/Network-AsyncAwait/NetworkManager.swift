//
//  NetworkManager.swift
//  MVVMSampleUikit
//
//  Created by Jinu on 22/01/2024.
//

import Foundation

public protocol NetworkService {
    func fetchData<T: Decodable>(from request: URLRequest) async throws -> T
    func performRequest<T: Decodable>(
        to endpoint: String,
        method: HTTPMethod,
        headers: [String: String],
        body: [String: Any]
    ) async throws -> T
}


public class NetworkManager: NetworkService {
        
    public func fetchData<T: Decodable>(
            from request: URLRequest
        ) async throws -> T {
            let session = URLSession.shared
            
            do {
                let (data, _) = try await session.data(for: request)
                
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    return decodedData
                } catch {
                    print("Error decoding JSON: \(error)")
                    print("Decoding failure for type \(T.self) with JSON data:")
                    print(String(data: data, encoding: .utf8) ?? "Invalid UTF-8 data")
                    throw APIError.decodingError(error)
                }
            } catch {
                print("Error fetching data: \(error)")
                throw APIError.networkError(error)
            }
        }
        
    public func performRequest<T: Decodable>(
            to endpoint: String,
            method: HTTPMethod,
            headers: [String: String] = [:],
            body: [String: Any] = [:]
        ) async throws -> T {
            var request = URLRequest(url: URL(string: endpoint)!)
            request.httpMethod = method.rawValue
            request.allHTTPHeaderFields = headers.isEmpty ? HTTPHeaders.commonHeaders : headers
            
            if method == .post || method == .put {
                request.httpBody = try JSONSerialization.data(withJSONObject: body)
            }
            
            return try await fetchData(from: request)
        }
    }
