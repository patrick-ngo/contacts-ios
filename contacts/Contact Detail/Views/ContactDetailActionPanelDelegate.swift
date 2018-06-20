//
//  ContactDetailActionPanelDelegate.swift
//  contacts
//
//  Created by Patrick Ngo on 2018-06-20.
//  Copyright © 2018 Patrick Ngo. All rights reserved.
//

import Foundation

protocol ContactDetailActionPanelDelegate:class {
    
    // Message
    func actionPanelMessagePressed()
    
    // Call
    func actionPanelCallPressed()
    
    // Email
    func actionPanelEmailPressed()
    
    // Favourite
    func actionPanelFavouritePressed()
}
