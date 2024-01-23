//
//  HTTPEndPoints.swift
//  MVVMSampleUikit
//
//  Created by Jinu on 22/01/2024.
//

import Foundation

// MARK: - HTTPEndPoints

public enum APIEndPoints {
    case guestToken
    case login
    // Add more endpoints as needed
}

extension APIEndPoints {
    var path: String {
        switch self {
        case .guestToken:
            return "api/guestToken"
        case .login:
            return "api/login"
        }
    }
}
