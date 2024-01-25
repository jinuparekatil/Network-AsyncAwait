//
//  chapterRepository.swift
//  MVVM-Architecht-UIKit-AsyncAwait
//
//  Created by Jinu on 24/01/2024.
//

import Network_AsyncAwait
import Combine
import Foundation

protocol GuestRepository {
    func fetchGuest() async throws -> Guest
}

class GuestRepositoryImplementation: GuestRepository {
    
    @Published private(set) var guest: Guest?
    @Published private(set) var error: Error?
    
    private let apiEndPoint: APIEndPoints = .guestToken
    private var method: APIMethod = .post
    private let baseURLString = Constants.API.baseURL
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchGuest() async throws -> Guest {
        guard let baseURL = URL(string: baseURLString) else {
            throw APIError.urlError
        }
        
        let parameters: APIRequestParameters = .body([
            "secret_key": Constants.API.secretKey,
            "device_type": Constants.API.deviceType,
            "device_id": Constants.API.devicId,
            "push_token": ""
        ])
        
        let builder = RequestBuilder(baseURL: baseURL, path: apiEndPoint.path)
        builder.set(headers: APIHeaders.defaultHeaders)
        builder.set(method: HTTPMethod(rawValue: method.rawValue) ?? .post)
        builder.set(parameters: parameters)
        
        do {
            return try await networkManager.makeRequest(with: builder, type: Guest.self)
        } catch {
            // Set the error property for further handling, e.g., UI updates
            self.error = error
            throw error
        }
    }
}

