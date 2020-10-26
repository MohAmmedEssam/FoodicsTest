//
//  ArrayExt.swift
//  Foodics
//
//  Created by Mohammed Essam on 10/26/20.
//  Copyright © 2020 Elhayes. All rights reserved.
//

import Foundation

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
