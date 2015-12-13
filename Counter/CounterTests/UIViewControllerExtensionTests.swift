//
//  UIViewControllerExtensionTests.swift
//  Counter
//
//  Created by Justin.Dombecki on 12/13/15.
//  Copyright © 2015 Justin.Dombecki. All rights reserved.
//

import XCTest
import UIKit

class TestUIViewControllerIB: UIViewController {
    @IBOutlet weak var subview : UIView!
    @IBOutlet weak var label : UILabel!
    @IBOutlet weak var button : UIButton!
}

class UIViewControllerExtensionTests: XCTestCase {
    
    var variableTestSubject : TestUIViewControllerIB?
    
    override func setUp() {
        super.setUp()
        
        let testBundle =  NSBundle(forClass: TestUIViewControllerIB.self)
        let storyboard = UIStoryboard.init(name: "TestStoryboard", bundle:testBundle)
        let viewController = storyboard.instantiateViewControllerWithIdentifier("TestUIViewControllerIB")
        variableTestSubject = viewController as? TestUIViewControllerIB
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testControllerLoaded() {
        XCTAssert(variableTestSubject != nil)
    }
    
    func testAccessiblityExtensionMethod() {
        if let testSubject = variableTestSubject {
            let labels = testSubject.accessibliseWithVarName()
            XCTAssert(labels.contains("subview"))
            XCTAssert(labels.contains("label"))
            XCTAssert(labels.contains("button"))
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
}

