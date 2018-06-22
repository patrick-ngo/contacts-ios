//
//  contactsUITests.swift
//  contactsUITests
//
//  Created by Patrick Ngo on 2018-06-19.
//  Copyright © 2018 Patrick Ngo. All rights reserved.
//

import XCTest

class contactsUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testGotoContactDetail() {
        let app = XCUIApplication()

        //exist predicate condition
        let exists = NSPredicate(format: "exists == true")


        //Find the contact listings table view
        let contactsListingTableView = app.tables["contacts_collectionview"]
        expectation(for: exists, evaluatedWith: contactsListingTableView, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(contactsListingTableView.exists)


        //Find the first available contact cell
        let contactCell = contactsListingTableView.cells.matching(identifier: "contact_listing_cell").element(boundBy: 0)
        expectation(for: exists, evaluatedWith: contactCell, handler: nil)

        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(contactCell.exists)
        contactCell.tap()


        //Once in the contact detail page, make sure back button exists
        let contactDetailBackButton = app.navigationBars.buttons.element(boundBy: 0)
        expectation(for: exists, evaluatedWith: contactDetailBackButton, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(contactDetailBackButton.exists)

        //Go back to contact listings
        contactDetailBackButton.tap()
    }
    
    func testGotoEditContact() {
        let app = XCUIApplication()
        
        //exist predicate condition
        let exists = NSPredicate(format: "exists == true")
        
        
        //Find the contact listings table view
        let contactsListingTableView = app.tables["contacts_collectionview"]
        expectation(for: exists, evaluatedWith: contactsListingTableView, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(contactsListingTableView.exists)
        
        
        //Find the first available contact cell
        let contactCell = contactsListingTableView.cells.matching(identifier: "contact_listing_cell").element(boundBy: 0)
        expectation(for: exists, evaluatedWith: contactCell, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(contactCell.exists)
        
        contactCell.tap()
        
        
        //Once in the contact detail page, make sure back button exists
        let contactDetailEditButton = app.navigationBars.buttons.element(boundBy: 1)
        expectation(for: exists, evaluatedWith: contactDetailEditButton, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(contactDetailEditButton.exists)
        
        contactDetailEditButton.tap()
        
        //Once in the contact detail page, make sure back button exists
        let editContactBackButton = app.navigationBars.buttons.element(boundBy: 0)
        expectation(for: exists, evaluatedWith: editContactBackButton, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(editContactBackButton.exists)
        
        editContactBackButton.tap()
    }
    
    func testGoToCreateContact() {
        let app = XCUIApplication()
        
        //exist predicate condition
        let exists = NSPredicate(format: "exists == true")
        
        //Once in the contact detail page, make sure back button exists
        let contactListingAddButton = app.navigationBars.buttons.element(boundBy: 1)
        expectation(for: exists, evaluatedWith: contactListingAddButton, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(contactListingAddButton.exists)
        
        contactListingAddButton.tap()
        
        //Once in the contact detail page, make sure back button exists
        let createContactBackButton = app.navigationBars.buttons.element(boundBy: 0)
        expectation(for: exists, evaluatedWith: createContactBackButton, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(createContactBackButton.exists)
        
        //Go back to contact listings
        createContactBackButton.tap()
    }
}
