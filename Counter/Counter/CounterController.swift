//
//  CounterController.swift
//  Counter
//
//  Created by Justin.Dombecki on 12/10/15.
//  Copyright © 2015 Justin.Dombecki. All rights reserved.
//

import UIKit

class CounterController : UIViewController {
    
    @IBOutlet weak var column : UIView!
    @IBOutlet weak var display : UILabel!
    @IBOutlet weak var toggle : UIButton!
    
    func reset () {
        counter = defaultCounter
        column.hidden = true
    }
    
    var defaultCounter : Int { get { return 0 } }
    var _counter : Int = 0
    var counter : Int {
        get {
            return _counter
        }
        set (newVal) {
            _counter = newVal
            display.text = "\(_counter)"
        }
    }
    
    func reduceCounterBy(value: Int) {
        counter -= value
    }
    
    func increaseCounterBy(value: Int) {
        counter += value
    }
    
    @IBAction func counterMinusButtonTapped(sender: AnyObject) {
        reduceCounterBy(1)
    }
    
    @IBAction func counterPlusButtonTapped(sender: AnyObject) {
        increaseCounterBy(1)
    }
    
    @IBOutlet weak var plusCounterButton: UIButton!
    @IBOutlet weak var minusCounterButton: UIButton!

    
    
    var isDisplayed : Bool { get { return column.hidden == false } }
    
    func toggleDisplay() {
        column.hidden = !column.hidden
    }
    
    @IBAction func toggleTapped(sender: AnyObject) {
        toggleDisplay()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
}