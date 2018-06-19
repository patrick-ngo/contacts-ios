//
//  ContactsListingCell.swift
//  contacts
//
//  Created by Patrick Ngo on 2018-06-19.
//  Copyright © 2018 Patrick Ngo. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class ContactsListingCell: UITableViewCell {
    
    //MARK: - Display data -
    
    var contact: ContactModel? = nil {
        didSet {
            //first name
            if let firstName = contact?.first_name {
                self.nameLabel.text = firstName
                
                // last name
                if let lastName = contact?.last_name {
                    self.nameLabel.text = "\(firstName) \(lastName)"
                }
            }
        }
    }
    
    //MARK: - Views -
    
    let avatarImageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 21 //size 42
        iv.layer.borderColor = UIColor.Border.line.cgColor
        iv.layer.borderWidth = 1
        iv.backgroundColor = UIColor.white
        return iv
    }()
    
    lazy var nameLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 13)
        lbl.textColor = UIColor.Text.darkGrey
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    //MARK: - Init -
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier:reuseIdentifier)
        
        self.setupViews()
    }
    
    func setupViews() {
        self.selectionStyle = .none
        
        self.contentView.addSubview(self.avatarImageView)
        self.contentView.addSubview(self.nameLabel)
        
        self.avatarImageView.snp.makeConstraints { (make) in
            make.top.equalTo(12)
            make.left.equalTo(16)
            make.width.height.equalTo(42)
        }
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.avatarImageView.snp.right).offset(16)
            make.right.equalTo(self.contentView)
            make.centerY.equalTo(self.avatarImageView.snp.centerY)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
