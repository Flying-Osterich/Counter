//
//  DefeatController.swift
//  Counter
//
//  Created by Justin.Dombecki on 12/10/15.
//  Copyright © 2015 Justin.Dombecki. All rights reserved.
//

import UIKit

class DefeatController : UIViewController {
    
    @IBOutlet weak var defeatOverlay : UIView!
    
    @IBAction func defeatOverlayTapped(sender: AnyObject) {
        defeatOverlay.hidden = true
    }
    
    func admitDefeat () {
        self.defeatOverlay.alpha = 0
        self.defeatOverlay.hidden = false
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.defeatOverlay.alpha = 1
        })
    }
}