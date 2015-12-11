//
//  PoisonCounterController.swift
//  Counter
//
//  Created by Justin.Dombecki on 12/10/15.
//  Copyright © 2015 Justin.Dombecki. All rights reserved.
//

import UIKit

class PoisonDefeatController : DefeatController {
    
}

class PoisonCounterController : MortalController {
    override func toggleDisplay() {
        super.toggleDisplay()
        toggle.enabled = false
    }
    
    override func reset() {
        super.reset()
        toggle.enabled = true
    }
    
    override var hasBeenDefeated : Bool {
        get {
            return counter >= 10
        }
    }
}