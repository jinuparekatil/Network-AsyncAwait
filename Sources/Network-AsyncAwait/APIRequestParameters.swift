//
//  HTTPRequuestParameters.swift
//  MVVMSampleUikit
//
//  Created by Jinu on 22/01/2024.
//

import Foundation

// MARK: - HTTPRequestParameters
public enum HTTPRequestParameters {
    case body(_: [String : Any]?)
    case url(_: [String:String]?)
}
