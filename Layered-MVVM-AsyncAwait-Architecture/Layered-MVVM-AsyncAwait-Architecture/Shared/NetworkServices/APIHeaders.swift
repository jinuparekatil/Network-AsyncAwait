//
//  APIHeaders.swift
//  MVVM-Architecht-UIKit-AsyncAwait
//
//  Created by Jinu on 24/01/2024.
//

import Foundation

enum APIHeaders {
    static var defaultHeaders: [String: String] = {
        let headers: [String: String] = [
            "Content-Type": "application/json"
//            "Accept": "application/json",
//            "X-RapidAPI-Key": ConfigurationManager.shared.radiAPIKey,
//            "X-RapidAPI-Host": ConfigurationManager.shared.rapidAPIHost,
        ]
        return headers
    }()
}
