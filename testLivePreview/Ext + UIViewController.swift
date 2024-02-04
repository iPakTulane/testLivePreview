//
//  Ext + UIViewController.swift
//  testLivePreview
//
//  Created by iPak Tulane on 02/02/24.
//

import SwiftUI

@available(iOS 13.0, *)
extension UIViewController {

    private struct Preview: UIViewControllerRepresentable {
        let vc: UIViewController
        
        func makeUIViewController(context: Context) -> some UIViewController {
            vc
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {

            if let colorChangeVC = uiViewController as? ColorChangeViewController {
                colorChangeVC.toggleColor()
            }
            
        }
        
    }
    
    func showPreview() -> some View {
        Preview(vc: self).edgesIgnoringSafeArea(.all)
    }
    
}
