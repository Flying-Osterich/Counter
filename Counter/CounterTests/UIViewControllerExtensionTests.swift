//
//  UIViewControllerExtensionTests.swift
//  Counter
//
//  Created by Justin.Dombecki on 12/13/15.
//  Copyright © 2015 Justin.Dombecki. All rights reserved.
//

import XCTest
import UIKit

class TestUIViewController: UIViewController {
//    @IBOutlet weak var subview : UIView!
//    @IBOutlet weak var label : UILabel!
    @IBOutlet weak var button : UIButton!
}

class UIViewControllerExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAccessiblityExtensionMethod() {
        let viewController = TestUIViewController.init()
//        viewController.subview = UIView.init(frame: CGRectZero)
//        viewController.label = UILabel.init(frame: CGRectZero)
        viewController.button = UIButton.init(type: .System)
        
//        XCTAssert(viewController.subview != nil)
//        XCTAssert(viewController.label != nil)
        XCTAssert(viewController.button != nil)
        
        let labels = viewController.accessibliseWithVarName()
//        XCTAssert(labels.contains("subview"))
//        XCTAssert(labels.contains("label"))
        XCTAssert(labels.contains("button"))
        
//        XCTAssertEqual(viewController.subview?.accessibilityIdentifier, "subview", "must accessiblise itself")
//        XCTAssertEqual(viewController.label?.accessibilityIdentifier, "label", "must accessiblise itself")
        XCTAssertEqual(viewController.button?.accessibilityIdentifier, "button", "must accessiblise itself")
    }
}

