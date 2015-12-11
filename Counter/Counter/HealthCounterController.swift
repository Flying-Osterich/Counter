//
//  HealthCounterController.swift
//  Counter
//
//  Created by Justin.Dombecki on 12/10/15.
//  Copyright © 2015 Justin.Dombecki. All rights reserved.
//

import UIKit

class HealthDefeatController : DefeatController {
    
}

class HealthCounterController : MortalController {    
    override func reset () {
        super.reset()
        column.hidden = false
    }
    
    override var defaultCounter : Int { get { return 20 } }
    
    @IBAction func counterMinusFiveButtonTapped(sender: AnyObject) {
        reduceCounterBy(5)
    }
    
    @IBAction func counterPlusFiveButtonTapped(sender: AnyObject) {
        increaseCounterBy(5)
    }
}