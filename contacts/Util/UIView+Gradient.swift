//
//  UIView+Gradient.swift
//  contacts
//
//  Created by Patrick Ngo on 2018-06-20.
//  Copyright © 2018 Patrick Ngo. All rights reserved.
//

import UIKit

extension UIView {

    func addGreenGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = UIScreen.main.bounds
        gradientLayer.startPoint = CGPoint.init(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint.init(x: 0.5, y: 1.0)
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.Text.green.cgColor]
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
