//
//  ChapterViewController.swift
//  MVVM-Architecht-UIKit-AsyncAwait
//
//  Created by Jinu on 24/01/2024.
//

import UIKit
import Combine

class ChapterViewController: UIViewController {
    var viewModel: HomeViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Subscribe to changes in guest and error
        viewModel.$guest
                   .sink { [weak self] guest in
                       if let guest = guest {
                           print("Guest updated: \(guest)")
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
    

    @IBAction func buttonPressed(_ sender: Any) {
        // Fetch guest data
        viewModel.fetchData()
    }
    

}
