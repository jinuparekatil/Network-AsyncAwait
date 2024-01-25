//
//  Guest.swift
//  MVVMSampleUikit
//
//  Created by Jinu on 22/01/2024.
//

import Foundation

struct Guest: Codable {
    let response, token: String?
    let printerName: String?
    let foodMenu, attractionsMenu, id: Int?
    let location: String?

    enum CodingKeys: String, CodingKey {
        case response, token
        case printerName
        case foodMenu
        case attractionsMenu
        case id, location
    }
}
