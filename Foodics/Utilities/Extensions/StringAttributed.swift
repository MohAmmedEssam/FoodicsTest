//
//  labelEXT.swift
//  Foodics
//
//  Created by Mohammed Essam on 9/24/20.
//  Copyright © 2020 Elhayes. All rights reserved.
//

import Foundation
import UIKit


extension NSMutableAttributedString {
    func setMultiText(_ textForAttribute: String,
                      withColor color: UIColor = DesignSystem.appColor(.TitlesDark) ,
                      font:UIFont = DesignSystem.appFont(.normal),
                      alignment:NSTextAlignment = .natural) {
        
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = 4.0
        paragraphStyle.alignment = alignment
        self.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:range)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        self.addAttribute(NSAttributedString.Key.font, value: font, range: range )
    }
}
