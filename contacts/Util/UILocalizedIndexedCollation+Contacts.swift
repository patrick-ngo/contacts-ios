//
//  UILocalizedIndexedCollation+Contacts.swift
//  contacts
//
//  Created by Patrick Ngo on 2018-06-20.
//  Copyright © 2018 Patrick Ngo. All rights reserved.
//

import UIKit

let collation = UILocalizedIndexedCollation.current()

extension UILocalizedIndexedCollation {
    
    //func for partition array in sections
    func partitionObjects(array:[ContactModel]) -> [[ContactModel]] {
        var alphabeticalSections = [[ContactModel]]()
        
        // Create a array to hold the data for each section (A-Z, #)
        for _ in self.sectionTitles {
            alphabeticalSections.append([]) //appending an empty array
        }
        // Put each contact into a section
        for item in array {
            let index = UILocalizedIndexedCollation.current().section(for: (item.first_name! as NSString), collationStringSelector: #selector(getter: NSString.uppercased))
            alphabeticalSections[index].append(item)
        }
        return alphabeticalSections
    }
}
