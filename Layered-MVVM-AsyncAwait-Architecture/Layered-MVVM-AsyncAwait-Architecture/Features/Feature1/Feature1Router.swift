//
//  Feature1Router.swift
//  Layered-MVVM-AsyncAwait-Architecture
//
//  Created by Jinu on 25/01/2024.
//


import UIKit

class Feature1Router {
    weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func navigateToFeature2() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            let feature2ViewController = Feature2ViewController()
            // Additional setup if needed
            self.viewController?.navigationController?.pushViewController(feature2ViewController, animated: true)
        }

    }
}
