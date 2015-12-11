//
//  MortalController.swift
//  Counter
//
//  Created by Justin.Dombecki on 12/10/15.
//  Copyright © 2015 Justin.Dombecki. All rights reserved.
//

import Foundation

class MortalController : CounterController {
    @IBOutlet weak var defeatController : DefeatController!
    var hasBeenDefeated : Bool {
        get {
            return counter <= 0
        }
    }
    
    override func reduceCounterBy(value: Int) {
        super.reduceCounterBy(value)
        if hasBeenDefeated {
            defeatController.admitDefeat()
        }
    }
    
    override func increaseCounterBy(value: Int) {
        super.increaseCounterBy(value)
        if hasBeenDefeated {
            defeatController.admitDefeat()
        }
    }
}