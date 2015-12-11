//
//  ViewController.swift
//  Counter
//
//  Created by Justin.Dombecki on 11/22/15.
//  Copyright © 2015 Justin.Dombecki. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController, ADBannerViewDelegate {

    @IBOutlet weak var leftPlayerContainer : UIView!
    @IBOutlet weak var rightPlayerContainer: UIView!
    
    func containersFaceYourPlayer () {
        leftPlayerContainer?.rotateView(.Left)
        rightPlayerContainer?.rotateView(.Right)
    }
    
    func accessiblisePlayerContainers () {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containersFaceYourPlayer()
        accessiblisePlayerContainers()
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        print(error)
        banner.hidden = true
    }
}

// MARK: Embedded
class PlayerViewController : UIViewController {

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
