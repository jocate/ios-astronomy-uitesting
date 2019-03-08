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
        
       // app.navigationBars["Sol 2"]

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testSavePhoto() {
       
        XCTAssertTrue(collectionView.exists)
        tapCell(0)
        detailViewPageExists()
        saveButton.tap()
        savePhotoAlertAppears()
        
    }
    
    func testNextButtonTapped() {
        
        let title = "Sol 15"
        titleIs(title)
        app.navigationBars[title]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        titleIs("Sol 16")

    }
    
    func testPreviousButtonTapped() {
        
        let title = "Sol 15"
        titleIs(title)
        app.navigationBars[title]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        titleIs("Sol 14")
        
       // XCUIApplication().navigationBars["Sol 1"].otherElements["Sol 1"].tap()
   
    }
    
    func testDetailViewBackToCollection() {
       
        XCTAssertTrue(collectionView.exists)
        tapCell(2)
        detailViewPageExists()
        app.navigationBars["Title"].buttons["Sol 15"].tap()
        XCTAssertTrue(collectionView.exists)
      
    }
    
    
    func detailViewPageExists() {
        
        XCTAssertTrue(detailImage.exists)
        let statusLabel = app.staticTexts["Camera:"]
        XCTAssertTrue(cameraLabel.exists)
        XCTAssertTrue(roverLabel.exists)
        XCTAssertTrue(statusLabel.exists)
        XCTAssertTrue(saveButton.exists)
        
    }
    
    func titleIs(_ title: String) {
        
        XCTAssert(app.navigationBars[title].exists)

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
    
    var roverLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.rover"]
    }
    
    var cameraLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.camera"]
    }
    
    
}
