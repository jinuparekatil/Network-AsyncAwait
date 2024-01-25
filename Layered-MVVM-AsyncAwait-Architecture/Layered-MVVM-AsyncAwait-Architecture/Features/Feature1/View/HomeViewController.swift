//
//  ChapterViewController.swift
//  MVVM-Architecht-UIKit-AsyncAwait
//
//  Created by Jinu on 24/01/2024.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    var viewModel: HomeViewModel!
    var feature1Router: Feature1Router?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupRouter()

        // Subscribe to changes in guest and error
        viewModel.$guest
            .sink { [weak self] guest in
                if let guest = guest {
                    print("Guest updated: \(guest)")
                    self?.feature1Router?.navigateToFeature2()
                } else {
                    print("Guest updated: nil")
                }
            }
            .store(in: &viewModel.cancellables)

        viewModel.$error
            .sink { error in
                print("Error updated: \(error?.localizedDescription ?? "nil")")
            }
            .store(in: &viewModel.cancellables)
    }

    func setupRouter() {
        feature1Router = Feature1Router(viewController: self)
    }

    @IBAction func buttonPressed(_ sender: Any) {
        // Fetch guest data
        viewModel.fetchData()
    }
}
