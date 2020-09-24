//
//  CollextionExt.swift
//  Foodics
//
//  Created by Mohammed Essam on 9/23/20.
//  Copyright © 2020 Elhayes. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {

    func setEmptyMessage() {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = "No data exist"
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
//        messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel;
    }

    func removeEmptyMessage() {
        self.backgroundView = nil
    }
}
