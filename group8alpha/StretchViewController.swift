//
//  StretchViewController.swift
//  group8alpha
//
//  Created by Tiffany Tsai on 11/8/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit
import Foundation

class StretchViewController: UIViewController, UIPopoverPresentationControllerDelegate  {
    
    
    
    @IBOutlet weak var b00: UIButton!
    @IBOutlet weak var b01: UIButton!
    @IBOutlet weak var b02: UIButton!
    @IBOutlet weak var b10: UIButton!
    @IBOutlet weak var b11: UIButton!
    @IBOutlet weak var b12: UIButton!
    @IBOutlet weak var b20: UIButton!
    @IBOutlet weak var b21: UIButton!
    @IBOutlet weak var b22: UIButton!

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var missLabel: UILabel!
    @IBOutlet weak var lvlLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var factLabel: UILabel!
    
    var timer00 = NSTimer();
    var timer01 = NSTimer();
    var timer02 = NSTimer();
    var timer10 = NSTimer();
    var timer11 = NSTimer();
    var timer12 = NSTimer();
    var timer20 = NSTimer();
    var timer21 = NSTimer();
    var timer22 = NSTimer();
    
    //state keeping for game
    var score:Int = 0
    var level:Int = 1
    var lost:Bool =  false
    var miss:Int = 0
    var maxBtns:Int = 0
    //counts how many buttons user has tapped
    var btnCount:Int = 0
    //time in seconds
    var hideTime:Double = 3.0
    var showTime:Double = 8.0
    
    var shownBtns: [[Bool]] = [[false,false,false], [false,false,false], [false,false,false]]
    
    let facts = ["Fun Fact! Spatial memory plays a role in recording information about one's environment and spatial orientation.", "Fun Fact! Spatial memory plays a role in short-term and long-term memory.", "Fun Fact! Spatial memory is what you use to remember the layout of your hometown.", "Fun Fact! This game helps stretch your spatial memory!", "Fun Fact! Someone who processes information verbally may perform poorly on spatial memory tests."]
    
    @IBAction func button00(sender: AnyObject) {
        b00.setBackgroundImage(UIImage(named:"circforapp"), forState: UIControlState.Normal)
        if (shownBtns[0][0] == false) {
            miss += 1
            missLabel.text = String(miss)
        }
        checkIfWon()
    }
    
    @IBAction func button01(sender: AnyObject) {
        b01.setBackgroundImage(UIImage(named:"circforapp"), forState: UIControlState.Normal)
        if (shownBtns[0][1] == false) {
            b01.setBackgroundImage(UIImage(named: "circforapp"), forState: UIControlState.Normal)
            miss += 1
            missLabel.text = String(miss)
        }
        checkIfWon()
    }

    @IBAction func button02(sender: AnyObject) {
        b02.setBackgroundImage(UIImage(named:"circforapp"), forState: UIControlState.Normal)
        if (shownBtns[0][2] == false) {
            b02.setBackgroundImage(UIImage(named: "circforapp"), forState: UIControlState.Normal)
            miss += 1
            missLabel.text = String(miss)
        }
        checkIfWon()
    }
    
    @IBAction func button10(sender: AnyObject) {
        b10.setBackgroundImage(UIImage(named:"circforapp"), forState: UIControlState.Normal)
        if (shownBtns[1][0] == false) {
            b10.setBackgroundImage(UIImage(named: "circforapp"), forState: UIControlState.Normal)
            miss += 1
            missLabel.text = String(miss)
        }
        checkIfWon()
    }

    @IBAction func button11(sender: AnyObject) {
        b11.setBackgroundImage(UIImage(named:"circforapp"), forState: UIControlState.Normal)
        if (shownBtns[1][1] == false) {
            b11.setBackgroundImage(UIImage(named: "circforapp"), forState: UIControlState.Normal)
            miss += 1
            missLabel.text = String(miss)
        }
        checkIfWon()
    }
    
    @IBAction func button12(sender: AnyObject) {
        b12.setBackgroundImage(UIImage(named:"circforapp"), forState: UIControlState.Normal)
        if (shownBtns[1][2] == false) {
            b12.setBackgroundImage(UIImage(named: "circforapp"), forState: UIControlState.Normal)
            miss += 1
            missLabel.text = String(miss)
        }
        checkIfWon()
    }
    
    @IBAction func button20(sender: AnyObject) {
        b20.setBackgroundImage(UIImage(named:"circforapp"), forState: UIControlState.Normal)
        if (shownBtns[2][0] == false) {
            b20.setBackgroundImage(UIImage(named: "circforapp"), forState: UIControlState.Normal)
            miss += 1
            missLabel.text = String(miss)
        }
        checkIfWon()
    }
    
    @IBAction func button21(sender: AnyObject) {
        b21.setBackgroundImage(UIImage(named:"circforapp"), forState: UIControlState.Normal)
        if (shownBtns[2][1] == false) {
            b21.setBackgroundImage(UIImage(named: "circforapp"), forState: UIControlState.Normal)
            miss += 1
            missLabel.text = String(miss)
        }
        checkIfWon()
    }
    
    @IBAction func button22(sender: AnyObject) {
        b22.setBackgroundImage(UIImage(named:"circforapp"), forState: UIControlState.Normal)
        if (shownBtns[2][2] == false) {
            b22.setBackgroundImage(UIImage(named: "circforapp"), forState: UIControlState.Normal)
            miss += 1
            missLabel.text = String(miss)
        }
        checkIfWon()
    }
    
    func checkIfWon() {
        btnCount += 1
        if (btnCount >= maxBtns && miss == 0) {
            hideButton()
            correctLabel.text = "Correct!"
            if(hideTime > 0.5){
               hideTime -= 0.1
            }
            level += 1
            score += 100
            scoreLabel.text = String(score)
            var num = Int(arc4random_uniform(5))
            factLabel.text = facts[num]
            nextButton.setTitle("Next Level", forState: UIControlState.Normal)
        }
        else if (btnCount >= maxBtns && miss != 0) {
            hideButton()
            correctLabel.text = "Incorrect"
            nextButton.setTitle("Retry Level", forState: UIControlState.Normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func runGame() {
        hideButton()
        miss = 0
        maxBtns = 0
        btnCount = 0
        nextButton.setTitle(" ", forState: UIControlState.Normal)
        scoreLabel.text = String(score)
        lvlLabel.text = String(level)
        missLabel.text = String(miss)
        correctLabel.text = ""
        
        var randbool: Bool
        for var x in 0..<shownBtns.count {
            for var y in 0..<shownBtns[x].count {
                randbool = randomBool()
                if(randbool && maxBtns > level * 3){
                    randbool = false
                }
                else if (randbool){
                    maxBtns += 1
                }
                shownBtns[x][y] = randbool
                
            }
        }
        timer00 = NSTimer.scheduledTimerWithTimeInterval(hideTime, target: self, selector: #selector(StretchViewController.showButton), userInfo: nil, repeats: false )
    }
    
    func randomBool() -> Bool {
        return arc4random_uniform(2) == 0
    }
    
    @IBAction func nextLvlAction(sender: AnyObject) {
        timer00.invalidate()
        factLabel.text = ""
        runGame()
    }
    
    func showButton() {
        if(shownBtns[0][0]) {
            b00.setBackgroundImage(UIImage(named:"circforapp"), forState: UIControlState.Normal)
        }
        if(shownBtns[0][1]) {
            b01.setBackgroundImage(UIImage(named:"circforapp"), forState: UIControlState.Normal)
        }
        if(shownBtns[0][2]) {
            b02.setBackgroundImage(UIImage(named:"circforapp"), forState: UIControlState.Normal)
        }
        if(shownBtns[1][0]) {
            b10.setBackgroundImage(UIImage(named:"circforapp"), forState: UIControlState.Normal)
        }
        if(shownBtns[1][1]) {
            b11.setBackgroundImage(UIImage(named:"circforapp"), forState: UIControlState.Normal)
        }
        if(shownBtns[1][2]) {
            b12.setBackgroundImage(UIImage(named:"circforapp"), forState: UIControlState.Normal)
        }
        if(shownBtns[2][0]) {
            b20.setBackgroundImage(UIImage(named:"circforapp"), forState: UIControlState.Normal)
        }
        if(shownBtns[2][1]) {
            b21.setBackgroundImage(UIImage(named:"circforapp"), forState: UIControlState.Normal)
        }
        if(shownBtns[2][2]) {
            b22.setBackgroundImage(UIImage(named:"circforapp"), forState: UIControlState.Normal)
        }
        var hideTimer = NSTimer()
        hideTimer = NSTimer.scheduledTimerWithTimeInterval(hideTime, target: self, selector: #selector(StretchViewController.hideButton), userInfo: nil, repeats: false)
    }
    
    func hideButton(){
        b00.setBackgroundImage(nil, forState: UIControlState.Normal)
        b01.setBackgroundImage(nil, forState: UIControlState.Normal)
        b02.setBackgroundImage(nil, forState: UIControlState.Normal)
        b10.setBackgroundImage(nil, forState: UIControlState.Normal)
        b11.setBackgroundImage(nil, forState: UIControlState.Normal)
        b12.setBackgroundImage(nil, forState: UIControlState.Normal)
        b20.setBackgroundImage(nil, forState: UIControlState.Normal)
        b21.setBackgroundImage(nil, forState: UIControlState.Normal)
        b22.setBackgroundImage(nil, forState: UIControlState.Normal)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PauseSegue" {
            let destination = segue.destinationViewController as! PauseViewController
//            destination.modalPresentationStyle = .Popover
//            let popoverPresentationController = destination.popoverPresentationController
//            if let _popoverPresentationController = popoverPresentationController {
//                _popoverPresentationController.sourceView = self.view
//                _popoverPresentationController.sourceRect = CGRectMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds) , 0, 0)
//                _popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirection.init(rawValue: 0)
//            }
            
//            destination.popoverPresentationController!.delegate = self
            destination.levelP = "\(level)"
            destination.scoreP = "\(score)"
        }
        
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }

}