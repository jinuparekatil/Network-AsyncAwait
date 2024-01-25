//
//  NetworkManager.swift
//  MVVM-Architecht-UIKit-AsyncAwait
//
//  Created by Jinu on 23/01/2024.
//

import Foundation
import Network_AsyncAwait

protocol NetworkManager {
    func makeRequest<T: Codable>(with builder: RequestBuilder, type: T.Type) async throws -> T
}

class NetworkManagerImplementation: NetworkManager {
    private let network: NetworkProtocol
    
    init(network: NetworkProtocol) {
        self.network = network
    }

    func makeRequest<T: Codable>(with builder: RequestBuilder, type: T.Type) async throws -> T {
        try await network.fetchData(with: builder)
    }
}
