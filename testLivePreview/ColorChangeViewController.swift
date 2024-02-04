//
//  ColorChangeViewController.swift
//  testLivePreview
//
//  Created by iPak Tulane on 02/02/24.
//

import SwiftUI
import UIKit

class ColorChangeViewController: UIViewController {

    private var isGreen = false
    
    private lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.text = "Background Color"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    private lazy var toggleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Toggle", for: .normal)
        button.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateBackgroundColor()
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(colorLabel)
        view.addSubview(toggleButton)
        
        colorLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        toggleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toggleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            toggleButton.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 20)
        ])
    }

    private func updateBackgroundColor() {
        view.backgroundColor = isGreen ? .green : .red
    }

    func toggleColor() {
        isGreen.toggle()
        updateBackgroundColor()
    }
    
    @objc private func toggleButtonTapped() {
        toggleColor()
    }
}


#if DEBUG

@available(iOS 13.0, *)
struct ColorChangeVCProvider: PreviewProvider {
    static var previews: some View {
        ColorChangeViewController().showPreview()
    }
}
#endif
