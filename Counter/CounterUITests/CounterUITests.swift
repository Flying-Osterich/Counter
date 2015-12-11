//
//  CounterUITests.swift
//  CounterUITests
//
//  Created by Justin.Dombecki on 11/22/15.
//  Copyright © 2015 Justin.Dombecki. All rights reserved.
//

import XCTest

class CounterUITests: XCTestCase {
        
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
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLeftPlayerContainerExists() {
        XCUIApplication().otherElements.containingType(.Image, identifier:"iAd Seed Ad").childrenMatchingType(.Other).elementBoundByIndex(1)
    }
    
    func testLeftPlayerContainerContainsHealthMinusFiveAction() {
        let element = XCUIApplication().otherElements.containingType(.Image, identifier:"iAd Seed Ad").childrenMatchingType(.Other).elementBoundByIndex(1)
        element.buttons["Health Minus Five Action"]
    }
    
    func testLeftPlayerHealthMinusFiveActionWillProduceDefeatWithFourUses() {
        let element = XCUIApplication().otherElements.containingType(.Image, identifier:"iAd Seed Ad").childrenMatchingType(.Other).elementBoundByIndex(1)
        let healthMinusFiveActionButton = element.buttons["Health Minus Five Action"]
        healthMinusFiveActionButton.tap()
        healthMinusFiveActionButton.tap()
        healthMinusFiveActionButton.tap()
        healthMinusFiveActionButton.tap()
        element.otherElements["Health Defeat Overlay"]
    }
    
    func testLeftPlayerHealthDefeatOverlayIsTappable() {
        let element = XCUIApplication().otherElements.containingType(.Image, identifier:"iAd Seed Ad").childrenMatchingType(.Other).elementBoundByIndex(1)
        let healthMinusFiveActionButton = element.buttons["Health Minus Five Action"]
        healthMinusFiveActionButton.tap()
        healthMinusFiveActionButton.tap()
        healthMinusFiveActionButton.tap()
        healthMinusFiveActionButton.tap()
        element.otherElements["Health Defeat Overlay"].tap()
        
    }
    
}
