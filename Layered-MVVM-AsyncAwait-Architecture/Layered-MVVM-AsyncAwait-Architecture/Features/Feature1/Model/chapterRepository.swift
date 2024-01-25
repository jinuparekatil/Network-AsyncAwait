//
//  chapterRepository.swift
//  MVVM-Architecht-UIKit-AsyncAwait
//
//  Created by Jinu on 24/01/2024.
//

import Network_AsyncAwait
import Combine
import Foundation

protocol ChaptersRepository {
    func fetchChapters() async throws -> Chapters
}

class ChaptersRepositoryImplementation: ChaptersRepository {
    
    private var network: NetworkManager
    
    init(network: NetworkManager) {
        self.network = network
    }

    // Assuming `BGNetworkManager` supports async/await
    // If not, you might need to use something like Combine's `Future` to wrap asynchronous calls.

    func fetchChapters() async throws -> Chapters {
        guard let baseURL = URL(string: Constants.API.baseURL) else {
            throw APIError.urlError
        }

        let request = RequestBuilder(baseURL: baseURL, path: APIEndPoints.chapters.path)
        request.set(headers: APIHeaders.defaultHeaders)
        request.set(method: HTTPMethod.get)

        do {
            return try await network.makeRequest(with: request, type: Chapters.self)
        } catch {
            throw APIError.networkError(error)
        }
    }
}
