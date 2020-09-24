//
//  ImageExt.swift
//  Foodics
//
//  Created by Mohammed Essam on 9/22/20.
//  Copyright © 2020 Elhayes. All rights reserved.
//


import Foundation
import UIKit

extension UIImageView {
    func imageFromURL(_ stringUrl: String?) {
        if let uRl = URL(string:    stringUrl ?? ""){
            DispatchQueue.global().async {
                if let data = try? Data( contentsOf:uRl){
                    DispatchQueue.main.async {
                        self.image = UIImage( data:data)
                    }
                }
            }
        }
    }
}
