//
//  Extensions.swift
//  BeerApp
//
//  Created by Andrea on 22/03/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import UIKit

extension UIViewController {
    public func add(asChildViewController viewController: UIViewController,to parentView:UIView) {
        // Add Child View Controller
        addChild(viewController)
        
        // Add Child View as Subview
        parentView.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = parentView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    public func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParent()
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
