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
            // profile photo
            if let profilePic = contact?.profile_pic {
                
                if profilePic == ContactsAPI.DEFAULT_IMG {
                    self.profilePhotoImageView.sd_setImage(with: URL(string: ContactsAPI.DEFAULT_IMG_URL))
                } else {
                    self.profilePhotoImageView.sd_setImage(with: URL(string: profilePic))
                }
            }
            // favourite star
            if let favourited = contact?.favorite {
                if favourited {
                    self.favouriteImageView.isHidden = false
                } else {
                    self.favouriteImageView.isHidden = true
                }
            }
        }
    }
    
    //MARK: - Views -
    
    let profilePhotoImageView : UIImageView = {
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
    
    let favouriteImageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "home_favourite")
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10 //size 20
        return iv
    }()
    
    //MARK: - Init -
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier:reuseIdentifier)
        
        self.setupViews()
    }
    
    func setupViews() {
        self.selectionStyle = .none
        
        self.contentView.addSubview(self.profilePhotoImageView)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.favouriteImageView)
        
        self.profilePhotoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(12)
            make.left.equalTo(16)
            make.width.height.equalTo(42)
        }
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.profilePhotoImageView.snp.right).offset(16)
            make.right.equalTo(self.contentView)
            make.centerY.equalTo(self.profilePhotoImageView.snp.centerY)
        }
        
        self.favouriteImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.profilePhotoImageView.snp.centerY)
            make.right.equalTo(-32)
            make.width.height.equalTo(20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
