//
//  EndPoints.swift
//  Foodics
//
//  Created by Mohammed Essam on 9/22/20.
//  Copyright © 2020 Elhayes. All rights reserved.
//

import Foundation

enum EndPoints:String{
    case categories = "/categories"
    case products = "/products?include=category"
}

