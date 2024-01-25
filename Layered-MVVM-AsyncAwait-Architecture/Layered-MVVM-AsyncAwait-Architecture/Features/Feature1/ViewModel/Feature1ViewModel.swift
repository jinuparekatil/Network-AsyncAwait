//
//  Feature1ViewModel.swift
//  MVVM-Architecht-UIKit-AsyncAwait
//
//  Created by Jinu on 24/01/2024.
//
import Combine
import Foundation
import Network_AsyncAwait

class HomeViewModel: ObservableObject {
    @Published private var chapters: Chapters = []
    @Published private(set) var error: Error?
    @Published private(set) var guest: Guest?
    var cancellables: Set<AnyCancellable> = []

    private let guestRepository: GuestRepository

    init(guestRepository: GuestRepository) {
        self.guestRepository = guestRepository
    }

    func fetchData() {
        Task {
            do {
                self.guest = try await guestRepository.fetchGuest()
                // Handle the fetched chapters if needed
                print("Fetched Chapters:", self.chapters)
            } catch {
                // Handle the error
                self.error = error
                print("Error fetching chapters:", error)
            }
        }
    }
}
