//
//  Constants.swift
//  MVVM-Architecht-UIKit-AsyncAwait
//
//  Created by Jinu on 23/01/2024.
//

import Foundation
import UIKit

struct Constants {
    struct API {
        static let baseURL = "https://cinergyapp.thetunagroup.com"
        static let apiKey = "your_api_key"
        
        static let devicId =  "CI - \(UUID().uuidString)"
        static let secretKey = "402620C92552D9303C58B901B43B0A41718E772C19520DD9A9AA52CE5A8FCB99"
        static let deviceType = "2"
        static let loginType = "2"
        static let locationId = "5"
        static var userId: Int?
        static var memberId: Int?
        static let keyChainKey = "com.ios.Cinergy-UIKit"
    }
    
    struct Colors {
        static let primaryColor = UIColor.blue
        static let secondaryColor = UIColor.green
    }
    
    struct UserDefaultsKeys {
        static let isLoggedIn = "IsLoggedIn"
        static let username = "Username"
    }
    
    // Other constants can be added here
}
