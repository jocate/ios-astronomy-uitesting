//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Jocelyn Stuart on 3/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        
        //super.setUp()
       
        continueAfterFailure = false
        
        app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        
        app.launch()

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testSavePhoto() {
       
        XCTAssertTrue(collectionView.exists)
        tapCell(0)
        testDetailViewPageExists()
        saveButton.tap()
        savePhotoAlertAppears()
        
    }
    
    func testNextButtonTapped() {
        
       
        
    }
    
    func testPreviousButtonTapped() {
        
        
    }
    
    func testDetailViewBackToCollection() {
        
        let app = XCUIApplication()
        app.collectionViews.children(matching: .cell).element(boundBy: 2).children(matching: .other).element.tap()
        app.navigationBars["Title"].buttons["Sol 1"].tap()
        
    }
    
    func testViewingDetailView() {
        
        
        
     
    }
    
    func testDetailViewPageExists() {
        
        XCTAssertTrue(detailImage.exists)
        let statusLabel = app.staticTexts["Camera:"]
        XCTAssertTrue(statusLabel.exists)
        XCTAssertTrue(saveButton.exists)
        
    }
    
    func savePhotoAlertAppears() {
        
        let savePhotoAlert = app.alerts["Photo Saved!"]
        XCTAssertTrue(savePhotoAlert.waitForExistence(timeout: 2))
     
    }
    
    func tapCell(_ index: Int, file: StaticString = #file, line: UInt = #line) {
        let cell = cellAt(index)
        cell.tap()
    }
    
    func cellAt(_ index: Int) -> XCUIElement {
        return collectionView.cells.element(boundBy: index)
    }
 
    var saveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    var collectionView: XCUIElement {
        return app.collectionViews.element(boundBy: 0)
    }
    
    var detailImage: XCUIElement {
       return app.images["PhotoDetailViewController.ImageView"]
    }
    
}
