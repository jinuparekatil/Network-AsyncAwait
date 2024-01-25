//
//  ViewModel2.swift
//  Layered-MVVM-AsyncAwait-Architecture
//
//  Created by Jinu on 25/01/2024.
//

import Foundation

// ViewModel2 for handling data
class ViewModel2 {
    private let randomValueGenerator: RandomValueGenerator

    init(randomValueGenerator: RandomValueGenerator) {
        self.randomValueGenerator = randomValueGenerator
    }

    func getRandomValue() -> Int {
        return randomValueGenerator.generateRandomValue()
    }
}
