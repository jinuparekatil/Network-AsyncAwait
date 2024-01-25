//
//  Feature1ViewModel.swift
//  MVVM-Architecht-UIKit-AsyncAwait
//
//  Created by Jinu on 24/01/2024.
//

import Combine
import Foundation
import Network_AsyncAwait

class HomeViewModel: ObservableObject {
    @Published private var chapters: Chapters = []
    @Published private(set) var guest: Guest?
    @Published private(set) var error: Error?
    let apiEndPoint: APIEndPoints = .guestToken
    private var method: APIMethod = .post
    let baseURLString = Constants.API.baseURL
    var cancellables: Set<AnyCancellable> = []

    private let networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    func fetchData() {
        guard let baseURL = URL(string: baseURLString) else {
            return
        }
        let parameters: APIRequestParameters = .body([
            "secret_key": Constants.API.secretKey,
            "device_type": Constants.API.deviceType,
            "device_id": Constants.API.devicId,
            "push_token": ""
        ])
        // Create a RequestBuilder instance with appropriate parameters
        let builder = RequestBuilder(baseURL: baseURL, path: apiEndPoint.path/* your parameters here */)
        builder.set(headers: APIHeaders.defaultHeaders)
        builder.set(method: HTTPMethod(rawValue: method.rawValue) ?? .post)
        builder.set(parameters: parameters)
        // Call the makeRequest method
        Task {
            do {
                let result: Guest = try await networkManager.makeRequest(with: builder, type: Guest.self)
                guest = result
                // Handle the result
                print("Successfully fetched data:", result)
            } catch {
                // Handle the error
                print("Error fetching data:", error)
            }
        }
    }
}
