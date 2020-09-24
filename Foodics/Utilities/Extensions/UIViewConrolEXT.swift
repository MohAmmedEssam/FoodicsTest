//
//  UIViewConrolEXT.swift
//  Foodics
//
//  Created by Mohammed Essam on 9/24/20.
//  Copyright © 2020 Elhayes. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{
    /// - Parameter child: Child view controller.
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        
        child.view.centerXAnchor.constraint(equalTo:  view.centerXAnchor).isActive = true
        child.view.centerYAnchor.constraint(equalTo:  view.centerYAnchor).isActive = true
        child.view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        child.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1).isActive = true
        child.view.translatesAutoresizingMaskIntoConstraints = false

        child.didMove(toParent: self)
    }
    /// It removes the child view controller from the parent.
    func remove() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}

