//
//  ContactEditRow.swift
//  contacts
//
//  Created by Patrick Ngo on 2018-06-21.
//  Copyright © 2018 Patrick Ngo. All rights reserved.
//

import UIKit

class ContactEditRow: UIView {
    
    let nameLabel:UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .right
        lbl.font = UIFont.systemFont(ofSize: 14)
        lbl.textColor = UIColor.Text.lightGrey
        return lbl
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textColor = UIColor.Text.darkGrey
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.nameLabel)
        self.addSubview(self.textField)
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.width.equalTo(80)
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
