//
//  ContactModel.swift
//  contacts
//
//  Created by Patrick Ngo on 2018-06-19.
//  Copyright © 2018 Patrick Ngo. All rights reserved.
//

import Foundation

struct ContactModel: Decodable {
    let id: Int?
    let first_name: String?
    let last_name: String?
    let email: String?
    let phone_number: String?
    let profile_pic: String?
    let favorite: Bool?
    let created_at: String?
    let updated_at: String?
}
