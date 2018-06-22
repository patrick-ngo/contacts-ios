//
//  ContactDetailActionPanel.swift
//  contacts
//
//  Created by Patrick Ngo on 2018-06-20.
//  Copyright © 2018 Patrick Ngo. All rights reserved.
//

import UIKit

class ContactDetailActionPanel: UIView {
    
    weak var delegate:ContactDetailActionPanelDelegate? = nil
    
    var favourited: Bool = false {
        didSet {
            self.favouriteImageView.image = favourited ? #imageLiteral(resourceName: "favourite_button_selected") : #imageLiteral(resourceName: "favourite_button")
        }
    }
    
    //MARK: - Views -
    
    lazy var messageButton : UIButton = {
        let btn = UIButton(type: UIButtonType.system)
        btn.addTarget(self, action: #selector(self.onPressMessage), for: .touchUpInside)
        
        let lbl = UILabel()
        lbl.text = "Message"
        lbl.font = UIFont.systemFont(ofSize: 12.0)
        lbl.textAlignment = .center
        lbl.textColor = UIColor.Text.darkGrey
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "message_button")
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 22 //size 44
        iv.backgroundColor = UIColor.white
        
        btn.addSubview(lbl)
        btn.addSubview(iv)
        
        iv.snp.makeConstraints { (make) in
            make.width.height.equalTo(44)
            make.top.equalTo(0)
            make.centerX.equalTo(btn)
        }
        
        lbl.snp.makeConstraints { (make) in
            make.width.equalTo(70)
            make.top.equalTo(iv.snp.bottom).offset(5)
            make.height.equalTo(20)
            make.centerX.equalTo(btn)
        }
        
        return btn
    }()
    
    lazy var callButton : UIButton = {
        let btn = UIButton(type: UIButtonType.system)
        btn.addTarget(self, action: #selector(self.onPressCall), for: .touchUpInside)
        
        let lbl = UILabel()
        lbl.text = "Call"
        lbl.font = UIFont.systemFont(ofSize: 12.0)
        lbl.textAlignment = .center
        lbl.textColor = UIColor.Text.darkGrey
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "call_button")
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 22 //size 44
        iv.backgroundColor = UIColor.white
        
        btn.addSubview(lbl)
        btn.addSubview(iv)
        
        iv.snp.makeConstraints { (make) in
            make.width.height.equalTo(44)
            make.top.equalTo(0)
            make.centerX.equalTo(btn)
        }
        
        lbl.snp.makeConstraints { (make) in
            make.width.equalTo(70)
            make.top.equalTo(iv.snp.bottom).offset(5)
            make.height.equalTo(20)
            make.centerX.equalTo(btn)
        }
        
        return btn
    }()
    
    lazy var emailButton : UIButton = {
        let btn = UIButton(type: UIButtonType.system)
        btn.addTarget(self, action: #selector(self.onPressEmail), for: .touchUpInside)
        
        let lbl = UILabel()
        lbl.text = "Email"
        lbl.font = UIFont.systemFont(ofSize: 12.0)
        lbl.textAlignment = .center
        lbl.textColor = UIColor.Text.darkGrey
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "email_button")
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 22 //size 44
        iv.backgroundColor = UIColor.white
        
        btn.addSubview(lbl)
        btn.addSubview(iv)
        
        iv.snp.makeConstraints { (make) in
            make.width.height.equalTo(44)
            make.top.equalTo(0)
            make.centerX.equalTo(btn)
        }
        
        lbl.snp.makeConstraints { (make) in
            make.width.equalTo(70)
            make.top.equalTo(iv.snp.bottom).offset(5)
            make.height.equalTo(20)
            make.centerX.equalTo(btn)
        }
        
        return btn
    }()
    
    lazy var favouriteButton : UIButton = {
        let btn = UIButton(type: UIButtonType.system)
        btn.addTarget(self, action: #selector(self.onPressFavourite), for: .touchUpInside)
        
        let lbl = UILabel()
        lbl.text = "Favourite"
        lbl.font = UIFont.systemFont(ofSize: 12.0)
        lbl.textAlignment = .center
        lbl.textColor = UIColor.Text.darkGrey
        
        btn.addSubview(lbl)
        btn.addSubview(self.favouriteImageView)
        
        self.favouriteImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(44)
            make.top.equalTo(0)
            make.centerX.equalTo(btn)
        }
        
        lbl.snp.makeConstraints { (make) in
            make.width.equalTo(70)
            make.top.equalTo(self.favouriteImageView.snp.bottom).offset(5)
            make.height.equalTo(20)
            make.centerX.equalTo(btn)
        }
        
        return btn
    }()
    
    let favouriteImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = #imageLiteral(resourceName: "favourite_button")
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 22 //size 44
        iv.backgroundColor = UIColor.white
        return iv
    }()
    
    

    //MARK: - Init -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    func setupViews() {
        let stackView = UIStackView(arrangedSubviews: [self.messageButton, self.callButton, self.emailButton, self.favouriteButton])
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.backgroundColor = .red
        
        self.addSubview(stackView)
        
        stackView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - On Press Handlers -
    
    @objc func onPressMessage() {
        if let delegate = self.delegate {
            delegate.actionPanelMessagePressed()
        }
    }
    
    @objc func onPressCall() {
        if let delegate = self.delegate {
            delegate.actionPanelCallPressed()
        }
    }
    
    @objc func onPressEmail() {
        if let delegate = self.delegate {
            delegate.actionPanelEmailPressed()
        }
    }
    
    @objc func onPressFavourite() {
        if let delegate = self.delegate {
            delegate.actionPanelFavouritePressed()
        }
    }
}
