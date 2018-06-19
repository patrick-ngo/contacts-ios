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
    
    var contactList: [ContactModel] = []

    
    //MARK: - Views -
    
    private lazy var tableView : UITableView = {
        let tv = UITableView(frame: CGRect.zero, style: .plain)
        tv.separatorStyle = .none
        tv.delegate = self
        tv.dataSource = self
        
        //cell registration
        tv.register(ContactsListingCell.self, forCellReuseIdentifier: String(describing: ContactsListingCell.self))
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
        navBar.tintColor = UIColor.Text.green
        navBar.barTintColor = UIColor.white
        navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.Text.darkGrey]
        self.navigationItem.title = "Contacts"
        
        if #available(iOS 11.0, *) {
            navBar.prefersLargeTitles = false
        }
        
        let groupsBtn = UIBarButtonItem(title: "Groups", style: .plain, target: self, action: #selector(onPressEdit))
        let addBtn = UIBarButtonItem(title: "＋", style: .plain, target: self, action: #selector(onPressAdd))
        
        navigationItem.leftBarButtonItem = groupsBtn
        navigationItem.rightBarButtonItem = addBtn
    }
    
    func setupViews() {
        self.view.addSubview(self.tableView)
        
        self.tableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(0)
        }
    }
    
    func loadData(reloadAll:Bool = false) {
        ContactsAPI.fetchContacts { (result, error) in
            if let result = result, error == nil {
                do {
                    let contactsResponse = try JSONDecoder().decode([ContactModel].self, from: result)
                    
                    //set list of contacts
                    self.contactList = contactsResponse
                    
                    //reload table
                    self.tableView.reloadData()
                }
                catch {
                    print("Error serializing json:", error)
                }
            }
        }
    }
    
    //MARK: - On Press handlers -
    
    @objc func onPressEdit() {
        // TODO: go to edit screen
    }
    
    @objc func onPressAdd() {
        // TODO: go to add contact screen
    }
    
    //MARK: - TableView Datasource -
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactCell = self.tableView.dequeueReusableCell(withIdentifier: String(describing: ContactsListingCell.self)) as? ContactsListingCell
        
        //set contact
        contactCell?.contact = contactList[indexPath.row]
        
        return contactCell!
    }
    
    
    //MARK: - TableView Delegate -
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //do nothing
    }
    
    
}
