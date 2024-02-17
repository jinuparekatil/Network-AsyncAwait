//
//  NetworkError.swift
//  MVVMSampleUikit
//
//  Created by Jinu on 22/01/2024.
//

import Foundation

public enum NetworkError: Error {
    case invalidRequest
    case invalidURL
    case invalidParameters
    case connectionError
    case serverError
}
