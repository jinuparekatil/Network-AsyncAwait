//
//  Feature2ViewController.swift
//  Layered-MVVM-AsyncAwait-Architecture
//
//  Created by Jinu on 25/01/2024.
//

import UIKit

class Feature2ViewController: UIViewController {
    
    private let viewModel2: ViewModel2

    init(viewModel2: ViewModel2) {
        self.viewModel2 = viewModel2
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        displayRandomValue()
    }

    func setupUI() {
        view.backgroundColor = .white

        let label = UILabel()
        label.text = "Random Value: "
        label.textAlignment = .center
        view.addSubview(label)

        // Add constraints here (e.g., centerX, centerY)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


    func displayRandomValue() {
        // Using the injected ViewModel2
        let randomValue = viewModel2.getRandomValue()
        print("Random Value in ViewController2: \(randomValue)")
    }
}
