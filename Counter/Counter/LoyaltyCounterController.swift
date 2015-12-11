//
//  LoyaltyCounterController.swift
//  Counter
//
//  Created by Justin.Dombecki on 12/10/15.
//  Copyright © 2015 Justin.Dombecki. All rights reserved.
//

import Foundation

class LoyalityCounterController : CounterController {
    override func reduceCounterBy(value: Int) {
        super.reduceCounterBy(value)
        if counter <= 0 {
            reset()
        }
    }
}