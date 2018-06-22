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
        guard let contact = self.contact else { return }
        guard let favourited = contact.favorite else { return }
        let contactParams = [ "favorite": String(!favourited) ]
        
        // Update contact's favorite
        ContactsAPI.updateContact(id: contact.id!, contactParams: contactParams) { (result, error) in
            if let result = result, error == nil {
                do {
                    let contactResponse = try JSONDecoder().decode(ContactModel.self, from: result)
                    
                    self.contact = contactResponse
                }
                catch {
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    self.present(alert, animated: true)
                }
                if let error = error {
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    self.present(alert, animated: true)
                }
            }
        }
    }
}
