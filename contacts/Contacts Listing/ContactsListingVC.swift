//
//  ContactsListingVC.swift
//  contacts
//
//  Created by Patrick Ngo on 2018-06-19.
//  Copyright © 2018 Patrick Ngo. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ContactListingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    //MARK: - Views -
    
    private lazy var tableView : UITableView = {
        let tv = UITableView(frame: CGRect.zero, style: .plain)
        tv.separatorStyle = .none
        tv.delegate = self
        tv.dataSource = self
        
        //cell registration
        tv.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
        return tv
    }()

    
    //MARK: - Init -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavBar()
        self.setupViews()
        self.loadData()
    }
    
    func setupNavBar() {
        UIApplication.shared.statusBarStyle = .lightContent
        
        guard let navBar = self.navigationController?.navigationBar else { return }
        navBar.tintColor = UIColor.Text.darkGrey
        navBar.barTintColor = UIColor.white
        navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.Text.darkGrey]
        self.navigationItem.title = "Contacts"
        
        if #available(iOS 11.0, *) {
            navBar.prefersLargeTitles = false
        }
    }
    
    func setupViews() {
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(0)
        }
    }
    
    func loadData(reloadAll:Bool = false) {
        //TODO: Load contacts here
    }
    
    @objc func reloadData(refreshControl:UIRefreshControl) {
        self.loadData(reloadAll:true)
    }
    
    //MARK: - TableView Datasource -
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self))
        
        return contactCell!
    }
    
    
    //MARK: - TableView Delegate -
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //do nothing
    }
    
    
}
