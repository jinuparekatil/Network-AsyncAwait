//
//  HTTPHeaders.swift
//  MVVMSampleUikit
//
//  Created by Jinu on 22/01/2024.
//

import Foundation

// MARK: - HTTPHeaders

public struct HTTPHeaders {
    static var commonHeaders: [String: String] {
        return [
            "Content-Type": "application/json",
//            "Authorization": "Bearer YOUR_ACCESS_TOKEN"
            // Add other headers as needed
        ]
    }
}
