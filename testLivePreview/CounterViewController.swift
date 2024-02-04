//
//  CounterViewController.swift
//  testLivePreview
//
//  Created by iPak Tulane on 02/02/24.
//

import SwiftUI
import UIKit

class CounterViewController: UIViewController {

    private var count = 0
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.text = "Count: \(count)"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        return label
    }()

    private lazy var incrementButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Increment", for: .normal)
        button.addTarget(self, action: #selector(incrementButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    private func setupUI() {
        view.addSubview(countLabel)
        view.addSubview(incrementButton)

        countLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20)
        ])

        incrementButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            incrementButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            incrementButton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 20)
        ])
    }

    @objc private func incrementButtonTapped() {
        count += 1
        updateCountLabel()
    }

    private func updateCountLabel() {
        countLabel.text = "Count: \(count)"
    }
}


#if DEBUG

@available(iOS 13.0, *)
struct CounterVCProvider: PreviewProvider {
    static var previews: some View {
        CounterViewController().showPreview()
    }
}
#endif
