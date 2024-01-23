//
//  NetworkManager.swift
//  MVVMSampleUikit
//
//  Created by Jinu on 22/01/2024.
//

import Foundation

public protocol NetworkService {
    func fetchData<T: Decodable>(with builder: RequestBuilder) async throws -> T
    func performRequest<T: Decodable>(
        baseURL: URL,
        to endpoint: String,
        method: HTTPMethod,
        headers: [String: String],
        body: APIRequestParameters
    ) async throws -> T
}

public class Network: NetworkService {
    private var urlSession: URLSession
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    public func fetchData<T: Decodable>(with builder: RequestBuilder) async throws -> T {
        let session = self.urlSession
        let request = try builder.build()

        do {
            let (data, _) = try await session.data(for: request)
            return try decodeData(data, ofType: T.self)
        } catch {
            print("Error fetching data: \(error)")
            throw APIError.networkError(error)
        }
    }

    public func performRequest<T>(
        baseURL: URL,
        to endpoint: String,
        method: HTTPMethod,
        headers: [String: String],
        body: APIRequestParameters
    ) async throws -> T where T: Decodable {
        let request = buildRequest(baseURL: baseURL, endpoint: endpoint, method: method, headers: headers, body: body)
        return try await fetchData(with: request)
    }

    private func decodeData<T: Decodable>(_ data: Data, ofType type: T.Type) throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Error decoding JSON: \(error)")
            print("Decoding failure for type \(T.self) with JSON data:")
            print(String(data: data, encoding: .utf8) ?? "Invalid UTF-8 data")
            throw APIError.decodingError(error)
        }
    }

    private func buildRequest(
        baseURL: URL,
        endpoint: String,
        method: HTTPMethod,
        headers: [String: String],
        body: APIRequestParameters
    ) -> RequestBuilder {
        let request = RequestBuilder(baseURL: baseURL, path: endpoint)
        request.set(headers: headers)
        request.set(method: method)
        request.set(parameters: body)
        return request
    }
}
