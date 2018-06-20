//
//  ContactsAPI.swift
//  contacts
//
//  Created by Patrick Ngo on 2018-06-19.
//  Copyright © 2018 Patrick Ngo. All rights reserved.
//

import Alamofire

typealias JSONCompletionBlock = ( [String:Any]? ,_ error: Error?) -> Void
typealias DataCompletionBlock = ( Data? ,_ error: Error?) -> Void

class ContactsAPI
{
    static let BASE_URL = "https://gojek-contacts-app.herokuapp.com"
    static let DEFAULT_IMG = "/images/missing.png"
    static let DEFAULT_IMG_URL = "\(BASE_URL)\(DEFAULT_IMG)"
    
    static let shared = ContactsAPI()
    
    //MARK: - API methods -
    
    // Get all contacts
    static func fetchContacts(completionHandler: @escaping DataCompletionBlock) {
        let endPoint = "/contacts.json"
        let url = URL(string: "\(ContactsAPI.BASE_URL)\(endPoint)")!
        
        let parameters: Parameters = [:]
        
        Alamofire.request(url, parameters: parameters).responseJSON { response in
            completionHandler(response.data, response.error)
        }
    }
    
    // Get a single contact
    static func fetchContact(id: Int, completionHandler: @escaping DataCompletionBlock) {
        let endPoint = "/contacts/\(id).json"
        let url = URL(string: "\(ContactsAPI.BASE_URL)\(endPoint)")!
        
        let parameters: Parameters = [:]
        
        Alamofire.request(url, parameters: parameters).responseJSON { response in
            completionHandler(response.data, response.error)
        }
    }
    
    // Update a contact
    static func updateContact(id: Int, contactParams: [String: String], completionHandler: @escaping DataCompletionBlock) {
        let endPoint = "/contacts/\(id).json"
        let url = URL(string: "\(ContactsAPI.BASE_URL)\(endPoint)")!
        
        //    Possible fields to update
        //    "first_name": "",
        //    "last_name": "",
        //    "email": "",
        //    "phone_number": "",
        //    "profile_pic": ""
        //    "favorite": false,

        Alamofire.request(url, method: .put, parameters: contactParams, encoding: JSONEncoding.default).responseJSON { (response) in
            completionHandler(response.data, response.error)
        }
    }
    
    // Create a contact
    static func createContact(contactParams: [String: String], completionHandler: @escaping DataCompletionBlock) {
        let endPoint = "/contacts.json"
        let url = URL(string: "\(ContactsAPI.BASE_URL)\(endPoint)")!
        
        Alamofire.request(url, method: .post, parameters: contactParams, encoding: JSONEncoding.default).responseJSON { (response) in
            completionHandler(response.data, response.error)
        }
    }
}
