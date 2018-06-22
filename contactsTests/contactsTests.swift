//
//  contactsTests.swift
//  contactsTests
//
//  Created by Patrick Ngo on 2018-06-19.
//  Copyright © 2018 Patrick Ngo. All rights reserved.
//

import XCTest
@testable import contacts

class contactsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchContact() {
        
        let testFetchContactExpectation = expectation(description: "Test fetchContact")
        
        ContactsAPI.fetchContact(id: 83) { (result, error) in
            if let result = result, error == nil {
                do {
                    let contactResponse = try JSONDecoder().decode(ContactModel.self, from: result)
                    XCTAssertNotNil(contactResponse)
                    XCTAssertEqual(contactResponse.first_name, "Prashant")
                    XCTAssertEqual(contactResponse.last_name, "Rastogi")
                    
                    testFetchContactExpectation.fulfill()
                }
                catch {
                    XCTAssertNil(error, "testFetchContact error detected")
                }
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }

    
    func testFetchContacts() {
        
        let testFetchContactsExpectation = expectation(description: "Test fetchContacts")
        
        ContactsAPI.fetchContacts { (result, error) in
            if let result = result, error == nil {
                do {
                    let contactsResponse = try JSONDecoder().decode([ContactModel].self, from: result)
                    XCTAssertNotNil(contactsResponse)

                    testFetchContactsExpectation.fulfill()
                }
                catch {
                    XCTAssertNil(error, "testFetchContacts error detected")
                }
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
}
