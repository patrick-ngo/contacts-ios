//
//  UIView+Border.swift
//  contacts
//
//  Created by Patrick Ngo on 2018-06-20.
//  Copyright © 2018 Patrick Ngo. All rights reserved.
//

import UIKit

extension UIView {
    
    func addTopBorder(with color: UIColor?, width: CGFloat) {
        
        let topBorder = UIView()
        topBorder.backgroundColor = color
        self.addSubview(topBorder)
        
        topBorder.snp.makeConstraints({ (make) in
            make.height.equalTo(width)
            make.top.equalTo(0)
            make.left.right.equalTo(0)
        })
    }
    
    func addRightBorder(with color: UIColor?, width: CGFloat) {
        
        let rightBorder = UIView()
        rightBorder.backgroundColor = color
        self.addSubview(rightBorder)
        
        rightBorder.snp.makeConstraints({ (make) in
            make.width.equalTo(width)
            make.top.bottom.equalTo(0)
            make.right.equalTo(0)
        })
    }
    
    func addBottomBorder(with color: UIColor?, width: CGFloat) {
        
        let bottomBorder = UIView()
        bottomBorder.backgroundColor = color
        self.addSubview(bottomBorder)
        
        bottomBorder.snp.makeConstraints({ (make) in
            make.height.equalTo(width)
            make.bottom.equalTo(0)
            make.left.right.equalTo(0)
        })
    }
    
    func addLeftBorder(with color: UIColor?, width: CGFloat) {
        
        let leftBorder = UIView()
        leftBorder.backgroundColor = color
        self.addSubview(leftBorder)
        
        leftBorder.snp.makeConstraints({ (make) in
            make.width.equalTo(width)
            make.top.bottom.equalTo(0)
            make.left.equalTo(0)
        })
    }
    
    func addBorder(left: Bool, right: Bool, top: Bool, bottom: Bool, color: UIColor?, width: CGFloat) {
        if left {
            addLeftBorder(with: color, width: width)
        }
        if right {
            addRightBorder(with: color, width: width)
        }
        if top {
            addTopBorder(with: color, width: width)
        }
        if bottom {
            addBottomBorder(with: color, width: width)
        }
    }
}
