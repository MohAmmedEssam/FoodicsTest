//
//  DesignSystem.swift
//  Foodics
//
//  Created by Mohammed Essam on 9/22/20.
//  Copyright © 2020 Elhayes. All rights reserved.
//

import Foundation
import UIKit

//MARK:- Colors
class DesignSystem{
    
    enum sysColor: String {
        case TitlesDark
        case FeatureGray
        
        var name:String{
            switch self {
            case .TitlesDark:
                return "TitlesDark"
            case .FeatureGray:
                return "FeatureGray"
                
            }
        }
    }
    static func appColor(_ color:sysColor)->UIColor{
        return UIColor(named: color.name) ?? UIColor.black
    }
}

//MARK:- Fonts
extension DesignSystem{
    enum sysFont {
        case veryLarge
        case large
        case medium
        case small
        case normal
        
        var name:UIFont{
            switch self {
            case .veryLarge:
                return .systemFont(ofSize: 20,weight: .bold)
            case .large:
                return .systemFont(ofSize: 17,weight: .bold)
            case .medium:
                return .systemFont(ofSize: 17,weight: .medium)
            case .small:
                return .systemFont(ofSize: 12,weight: .regular)
            case .normal:
                return .systemFont(ofSize: 17,weight: .regular)
            }
        }
    }

    static func appFont(_ font:sysFont)->UIFont{
        return font.name
    }
}
