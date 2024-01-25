//
//  DateUtility.swift
//  MVVM-Architecht-UIKit-AsyncAwait
//
//  Created by Jinu on 23/01/2024.
//

import Foundation

class DateUtility {
    static func formattedDate(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: date)
    }
    
    // Other date-related utility methods can be added here
}
