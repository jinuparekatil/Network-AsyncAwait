//
//  RandomValueGenerator.swift
//  Layered-MVVM-AsyncAwait-Architecture
//
//  Created by Jinu on 25/01/2024.
//

import Foundation

// RandomValueGenerator protocol
protocol RandomValueGenerator {
    func generateRandomValue() -> Int
}

// SimpleRandomValueGenerator implementation
class SimpleRandomValueGenerator: RandomValueGenerator {
    func generateRandomValue() -> Int {
        return Int.random(in: 1...100)
    }
}
