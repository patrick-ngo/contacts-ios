//
//  UIColor+Hex.swift
//  contacts
//
//  Created by Patrick Ngo on 2018-06-19.
//  Copyright © 2018 Patrick Ngo. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hex: Int) {
        self.init(red: (CGFloat((hex & 0xff0000) >> 16)) / 255.0, green: (CGFloat((hex & 0xff00) >> 8)) / 255.0, blue: (CGFloat(hex & 0xff)) / 255.0, alpha: 1.0)
    }
    
    struct Button {
        static let green =  UIColor(hex: 0x50E3C2)
    }
    
    struct Text {
        static let darkGrey = UIColor(hex: 0x4A4A4A)
        static let green =  UIColor(hex: 0x50E3C2)
    }
    
    struct Border {
        static let line = UIColor(hex: 0xF0F0F0)
    }
    
    struct Background {
        static let white = UIColor(hex: 0xFFFFFF)
        static let grey = UIColor(hex: 0xE8E8E8)
    }
}
