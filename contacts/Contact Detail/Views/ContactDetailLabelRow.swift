//
//  ContactDetailLabelRow.swift
//  contacts
//
//  Created by Patrick Ngo on 2018-06-19.
//  Copyright © 2018 Patrick Ngo. All rights reserved.
//

import UIKit

class ContactDetailLabelRow: UIView {
    
    let nameLabel:UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.Text.lightGrey
        return lbl
    }()
    
    let textField: UILabel = {
        let tf = UILabel()
        tf.textColor = UIColor.Text.darkGrey
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.nameLabel)
        self.addSubview(self.textField)
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(24)
            make.width.equalTo(70)
            make.top.bottom.equalTo(0)
        }
        self.textField.snp.makeConstraints { (make) in
            make.left.equalTo(self.nameLabel.snp.right).offset(32)
            make.right.equalTo(-15)
            make.top.bottom.equalTo(0)
        }
        
        self.addBottomBorder(with: UIColor.Border.line, width: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
