//
//  ContactDetailVC+ActionPanel.swift
//  contacts
//
//  Created by Patrick Ngo on 2018-06-20.
//  Copyright © 2018 Patrick Ngo. All rights reserved.
//
import UIKit

extension ContactDetailVC {
    
    func actionPanelMessagePressed() {
        if let contactNumber = self.contact?.phone_number {
            let url = "sms:\(contactNumber)"
            UIApplication.shared.open(URL(string: url)!)
        }
    }
    
    func actionPanelCallPressed() {
        if let contactNumber = self.contact?.phone_number {
            let url = "tel:\(contactNumber)"
            UIApplication.shared.open(URL(string: url)!)
        }
    }
    
    func actionPanelEmailPressed() {
        if let email = self.contact?.email {
            let url = "mailto:\(email)"
            UIApplication.shared.open(URL(string: url)!)
        }
    }
    
    func actionPanelFavouritePressed() {
        //TODO: toggle favourite
    }
}
