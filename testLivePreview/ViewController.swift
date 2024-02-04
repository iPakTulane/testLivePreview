//
//  ViewController.swift
//  testLivePreview
//
//  Created by iPak Tulane on 02/02/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    let helloLabel: UILabel  = {
        let label = UILabel()
        label.text = "Hello, World!"
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        setupConstraints()
    }

    private func setupConstraints() {
        view.addSubview(helloLabel)
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

}


#if DEBUG

@available(iOS 13.0, *)
struct VCProvider: PreviewProvider {
    static var previews: some View {
        ViewController().showPreview()
    }
}
#endif

