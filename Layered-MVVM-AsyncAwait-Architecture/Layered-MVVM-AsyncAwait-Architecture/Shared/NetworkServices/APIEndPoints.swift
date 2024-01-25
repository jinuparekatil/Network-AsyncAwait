//
//  AppEndPoints.swift
//  Cinergy-Network-1
//
//  Created by Jinu on 20/01/2024.
//

import Foundation

enum APIEndPoints  {
    case guestToken
    case login
    case escapeRoomMovies
    case getMovieInfo
    case chapters
    case chapter(chapternumber: String)
   
}

extension APIEndPoints {
    var path: String {
        switch self {
        case .guestToken:
            return "api/guestToken"
        case .login:
            return "api/login"
        case .escapeRoomMovies:
            return "api/escapeRoomMovies"
        case .getMovieInfo:
            return "api/getMovieInfo"
        case .chapters:
            return "/v2/chapters/"
        case let .chapter(chaptermmber):
            return "/v2/chapters/\(chaptermmber)/"
        }
    }
}
