//
//  HTTPError.swift
//  MVVMSampleUikit
//
//  Created by Jinu on 22/01/2024.
//

import Foundation

// MARK: - HTTPError

public enum APIError: Error {
    case networkError(Error)
    case decodingError(Error)
    case serverError(Int)
    case urlError
    case unknownError(String)
    
    // You can add more cases based on your specific needs
}
