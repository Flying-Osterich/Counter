//
//  ViewController.swift
//  Counter
//
//  Created by Justin.Dombecki on 11/22/15.
//  Copyright © 2015 Justin.Dombecki. All rights reserved.
//

import UIKit
import iAd

enum RotationDirection {
    case Left
    case Right
}

extension UIView {
    func rotateView(direction : RotationDirection) {
        switch direction {
            case .Left:
                self.layer.setAffineTransform(CGAffineTransformRotate(self.layer.affineTransform(), CGFloat(M_PI_2)))
            case .Right:
                self.layer.setAffineTransform(CGAffineTransformRotate(self.layer.affineTransform(), CGFloat(-M_PI_2)))
        }
        
    }
}

class ViewController: UIViewController, ADBannerViewDelegate {

    @IBOutlet weak var leftPlayerContainer : UIView!
    @IBOutlet weak var rightPlayerContainer: UIView!
    
    func containersFaceYourPlayer () {
        leftPlayerContainer?.rotateView(.Left)
        rightPlayerContainer?.rotateView(.Right)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containersFaceYourPlayer()
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        print(error)
        banner.hidden = true
    }
}

// MARK: Embedded
class CounterViewController : UIViewController {

    @IBOutlet weak var healthCounterController : HealthCounterController!
    @IBOutlet weak var poisonCounterController : PoisonCounterController!
    @IBOutlet weak var loyalityCounterController : LoyalityCounterController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
    }
    
    @IBAction func resetButtonTapped(sender: AnyObject) {
        reset()
    }
    
    func reset () {
        healthCounterController.reset()
        poisonCounterController.reset()
        loyalityCounterController.reset()
        
        addCounter.hidden = false
        extraOneCounterController.reset()
        extraTwoCounterController.reset()
    }
    
    @IBOutlet weak var addCounter : UIButton!
    @IBOutlet weak var extraOneCounterController : CounterController!
    @IBOutlet weak var extraTwoCounterController : CounterController!
    
    @IBAction func addCounter(sender: AnyObject) {
        if extraOneCounterController.isDisplayed == false {
            extraOneCounterController.toggleDisplay()
        } else if extraTwoCounterController.isDisplayed == false {
            extraTwoCounterController.toggleDisplay()
            addCounter.hidden = true
        }
    }
}

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

class LoyalityCounterController : CounterController {
    override func reduceCounterBy(value: Int) {
        super.reduceCounterBy(value)
        if counter <= 0 {
            reset()
        }
    }
}

// MARK: Abstraction
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
