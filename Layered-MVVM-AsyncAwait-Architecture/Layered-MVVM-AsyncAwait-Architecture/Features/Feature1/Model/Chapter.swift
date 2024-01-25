//
//  Chapter.swift
//  MVVM-Architecht-UIKit-AsyncAwait
//
//  Created by Jinu on 24/01/2024.
//

import Foundation
// MARK: - ChapterElement

struct Chapter: Codable {
    let id: Int?
    let name, slug, nameTransliterated, nameTranslated: String?
    let versesCount, chapterNumber: Int?
    let nameMeaning, chapterSummary, chapterSummaryHindi: String?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case nameTransliterated
        case nameTranslated
        case versesCount
        case chapterNumber
        case nameMeaning
        case chapterSummary
        case chapterSummaryHindi
    }
}

typealias Chapters = [Chapter]
