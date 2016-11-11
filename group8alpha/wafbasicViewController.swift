//
//  wafbasicViewController.swift
//  group8alpha
//
//  Created by Tiffany Tsai on 10/23/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit

class wafbasicViewController: UIViewController, UIPopoverPresentationControllerDelegate  {
    
    //buttons
    @IBOutlet weak var b00: UIButton!
    @IBOutlet weak var b01: UIButton!
    @IBOutlet weak var b02: UIButton!
    @IBOutlet weak var b10: UIButton!
    @IBOutlet weak var b11: UIButton!
    @IBOutlet weak var b12: UIButton!
    @IBOutlet weak var b20: UIButton!
    @IBOutlet weak var b21: UIButton!
    @IBOutlet weak var b22: UIButton!
    
    //2 timers for each button
    var timer00a = NSTimer();
    var timer00b = NSTimer();
    var timer01a = NSTimer();
    var timer01b = NSTimer();
    var timer02a = NSTimer();
    var timer02b = NSTimer();
    var timer10a = NSTimer();
    var timer10b = NSTimer();
    var timer11a = NSTimer();
    var timer11b = NSTimer();
    var timer12a = NSTimer();
    var timer12b = NSTimer();
    var timer20a = NSTimer();
    var timer20b = NSTimer();
    var timer21a = NSTimer();
    var timer21b = NSTimer();
    var timer22a = NSTimer();
    var timer22b = NSTimer();
    
    //state keeping for game
    var score:Int = 0
    var level:Int = 1
    var lost:Bool =  false
    var miss:Int = 0
    //time in seconds
    var hideTime:UInt32 = 6
    var showTime:Double = 8.0
    
    //labels

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var lvlLabel: UILabel!
    @IBOutlet weak var missLabel: UILabel!


    
    //Actions to take when buttons are pressed
    @IBAction func button00(sender: UIButton) {
        if b00.hidden == false {
            b00.hidden = true
            addPoints()
        }
        timer00a.tolerance = 2.0
    }
    
    @IBAction func button01(sender: UIButton) {
        if b01.hidden == false {
            b01.hidden = true
            addPoints()
        }
        timer01a.tolerance = 2.0
    }
    
    @IBAction func button02(sender: UIButton) {
        if b02.hidden == false {
            b02.hidden = true
            addPoints()
        }
        timer02a.tolerance = 2.0
    }
    
    @IBAction func button10(sender: UIButton) {
        if b10.hidden == false {
            b10.hidden = true
            addPoints()
        }
        timer10a.tolerance = 2.0
    }
    
    @IBAction func button11(sender: UIButton) {
        if b11.hidden == false {
            b11.hidden = true
            addPoints()
        }
        timer11a.tolerance = 2.0
    }
    
    @IBAction func button12(sender: UIButton) {
        if b12.hidden == false {
            b12.hidden = true
            addPoints()
        }
        timer12a.tolerance = 2.0
    }
    
    @IBAction func button20(sender: UIButton) {
        if b20.hidden == false {
            b20.hidden = true
            addPoints()
        }
        timer20a.tolerance = 2.0
    }
    
    @IBAction func button21(sender: UIButton) {
        if b21.hidden == false {
            b21.hidden = true
            addPoints()
        }
        timer21a.tolerance = 2.0
    }
    
    @IBAction func button22(sender: UIButton) {
        if b22.hidden == false {
            b22.hidden = true
            addPoints()
        }
        timer22a.tolerance = 2.0
    }
    
    //maintain game states and changes when buttons are shown
    func addPoints() {
        score += 100
        
        if(score % 1000 == 0) {
            level += 1
            lvlLabel.text = String(level)
            hideTime = hideTime - 1
            changeShow()
        }
        scoreLabel.text = String(score)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = String(score)
        lvlLabel.text = String(level)
        missLabel.text = String(miss)
        runGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // sets game state to run, start button timers
    func runGame() {
        b00.hidden = true
        b01.hidden = true
        b02.hidden = true
        b10.hidden = true
        b11.hidden = true
        b12.hidden = true
        b20.hidden = true
        b21.hidden = true
        b22.hidden = true
        
        var hideTimer = NSTimer()
        hideTimer = NSTimer.scheduledTimerWithTimeInterval(Double(arc4random_uniform(6) + hideTime), target: self, selector: #selector(wafbasicViewController.changeHide), userInfo: nil, repeats: true)
        
        //amount of time hidden
        timer00a = NSTimer.scheduledTimerWithTimeInterval(Double(arc4random_uniform(6) + hideTime), target: self, selector: #selector(wafbasicViewController.showButton), userInfo: nil, repeats: true )
        //amount of time shown
        timer00b = NSTimer.scheduledTimerWithTimeInterval(showTime, target: self, selector: #selector(wafbasicViewController.hideButton), userInfo: nil, repeats: true )
        
        timer01a = NSTimer.scheduledTimerWithTimeInterval(Double(arc4random_uniform(6) +  hideTime), target: self, selector: #selector(wafbasicViewController.showButton01), userInfo: nil, repeats: true )
        timer01b = NSTimer.scheduledTimerWithTimeInterval(showTime, target: self, selector: #selector(wafbasicViewController.hideButton01), userInfo: nil, repeats: true )
        
        timer02a = NSTimer.scheduledTimerWithTimeInterval(Double(arc4random_uniform(6) +  hideTime), target: self, selector: #selector(wafbasicViewController.showButton02), userInfo: nil, repeats: true )
        timer02b = NSTimer.scheduledTimerWithTimeInterval(showTime, target: self, selector: #selector(wafbasicViewController.hideButton02), userInfo: nil, repeats: true )

        timer10a = NSTimer.scheduledTimerWithTimeInterval(Double(arc4random_uniform(6) +  hideTime), target: self, selector: #selector(wafbasicViewController.showButton10), userInfo: nil, repeats: true )
        timer10b = NSTimer.scheduledTimerWithTimeInterval(showTime, target: self, selector: #selector(wafbasicViewController.hideButton10), userInfo: nil, repeats: true )
        
        timer11a = NSTimer.scheduledTimerWithTimeInterval(Double(arc4random_uniform(6) +  hideTime), target: self, selector: #selector(wafbasicViewController.showButton11), userInfo: nil, repeats: true )
        timer11b = NSTimer.scheduledTimerWithTimeInterval(showTime, target: self, selector: #selector(wafbasicViewController.hideButton11), userInfo: nil, repeats: true )
        
        timer12a = NSTimer.scheduledTimerWithTimeInterval(Double(arc4random_uniform(6) +  hideTime), target: self, selector: #selector(wafbasicViewController.showButton12), userInfo: nil, repeats: true )
        timer12b = NSTimer.scheduledTimerWithTimeInterval(showTime, target: self, selector: #selector(wafbasicViewController.hideButton12), userInfo: nil, repeats: true )
        
        timer20a = NSTimer.scheduledTimerWithTimeInterval(Double(arc4random_uniform(6) +  hideTime), target: self, selector: #selector(wafbasicViewController.showButton20), userInfo: nil, repeats: true )
        timer20b = NSTimer.scheduledTimerWithTimeInterval(showTime, target: self, selector: #selector(wafbasicViewController.hideButton20), userInfo: nil, repeats: true )
        
        timer21a = NSTimer.scheduledTimerWithTimeInterval(Double(arc4random_uniform(6) +  hideTime), target: self, selector: #selector(wafbasicViewController.showButton21), userInfo: nil, repeats: true )
        timer21b = NSTimer.scheduledTimerWithTimeInterval(showTime, target: self, selector: #selector(wafbasicViewController.hideButton21), userInfo: nil, repeats: true )
        
        timer22a = NSTimer.scheduledTimerWithTimeInterval(Double(arc4random_uniform(6) +  hideTime), target: self, selector: #selector(wafbasicViewController.showButton22), userInfo: nil, repeats: true )
        timer22b = NSTimer.scheduledTimerWithTimeInterval(showTime, target: self, selector: #selector(wafbasicViewController.hideButton22), userInfo: nil, repeats: true )
    }
    
    //selector functions for timers
    func showButton() {
        b00.hidden = false
    }
    
    func hideButton() {
        if b00.hidden == false {
            missBtn()
        }
        b00.hidden = true
    }
    
    func showButton01() {
        b01.hidden = false
    }
    
    func hideButton01() {
        if b01.hidden == false {
            missBtn()
        }
        b01.hidden = true
    }
    
    func showButton02() {
        b02.hidden = false
    }
    
    func hideButton02(){
        if b02.hidden == false {
            missBtn()
        }
        b02.hidden = true
    }
    
    func showButton10() {
        b10.hidden = false
    }
    
    func hideButton10() {
        if b10.hidden == false {
            missBtn()
        }
        b10.hidden = true
    }
    func showButton11() {
        b11.hidden = false
    }
    
    func hideButton11() {
        if b11.hidden == false {
            missBtn()
        }
        b11.hidden = true
    }
    
    func showButton12() {
        b12.hidden = false
    }
    
    func hideButton12()
    {
        if b12.hidden == false {
            missBtn()
        }
        b12.hidden = true
    }
    
    func showButton20() {
        b20.hidden = false
    }
    
    func hideButton20() {
        if b20.hidden == false {
            missBtn()
        }
        b20.hidden = true
    }
    
    func showButton21() {
        b21.hidden = false
    }
    
    func hideButton21() {
        if b21.hidden == false {
            missBtn()
        }
        b21.hidden = true
    }
    
    func showButton22() {
        b22.hidden = false
    }
    
    func hideButton22() {
        if b21.hidden == false {
            missBtn()
        }
        b22.hidden = true
    }
    
    //keeps track of misses
    func missBtn() {
        miss += 1
        missLabel.text = String(miss)
//        if miss > 15 {
//          TO DO, implement LOSE when miss > 15
//        }
    }
    
    
    //updates showTime and timers
    func changeShow() {
        showTime = showTime - 0.5
//        if showTime < 3 {
//            TO DO, implement WIN when almost impossible to press buttons
//        }
        timer00b = NSTimer.scheduledTimerWithTimeInterval(showTime, target: self, selector: #selector(wafbasicViewController.hideButton), userInfo: nil, repeats: true )
        timer01b = NSTimer.scheduledTimerWithTimeInterval(showTime, target: self, selector: #selector(wafbasicViewController.hideButton01), userInfo: nil, repeats: true )
        timer02b = NSTimer.scheduledTimerWithTimeInterval(showTime, target: self, selector: #selector(wafbasicViewController.hideButton02), userInfo: nil, repeats: true )
        timer10b = NSTimer.scheduledTimerWithTimeInterval(showTime, target: self, selector: #selector(wafbasicViewController.hideButton10), userInfo: nil, repeats: true )
        timer11b = NSTimer.scheduledTimerWithTimeInterval(showTime, target: self, selector: #selector(wafbasicViewController.hideButton11), userInfo: nil, repeats: true )
        timer12b = NSTimer.scheduledTimerWithTimeInterval(showTime, target: self, selector: #selector(wafbasicViewController.hideButton12), userInfo: nil, repeats: true )
        timer20b = NSTimer.scheduledTimerWithTimeInterval(showTime, target: self, selector: #selector(wafbasicViewController.hideButton20), userInfo: nil, repeats: true )
        timer21b = NSTimer.scheduledTimerWithTimeInterval(showTime, target: self, selector: #selector(wafbasicViewController.hideButton21), userInfo: nil, repeats: true )
        timer22b = NSTimer.scheduledTimerWithTimeInterval(showTime, target: self, selector: #selector(wafbasicViewController.hideButton22), userInfo: nil, repeats: true )
        
    }
    
    //updates timers to change to new hideTime
    func changeHide() {
        timer00a = NSTimer.scheduledTimerWithTimeInterval(Double(arc4random_uniform(10) + hideTime), target: self, selector: #selector(wafbasicViewController.showButton), userInfo: nil, repeats: true )
        timer01a = NSTimer.scheduledTimerWithTimeInterval(Double(arc4random_uniform(10) +  hideTime), target: self, selector: #selector(wafbasicViewController.showButton01), userInfo: nil, repeats: true )
        timer02a = NSTimer.scheduledTimerWithTimeInterval(Double(arc4random_uniform(10) +  hideTime), target: self, selector: #selector(wafbasicViewController.showButton02), userInfo: nil, repeats: true )
        timer10a = NSTimer.scheduledTimerWithTimeInterval(Double(arc4random_uniform(10) + hideTime), target: self, selector: #selector(wafbasicViewController.showButton10), userInfo: nil, repeats: true )
        timer11a = NSTimer.scheduledTimerWithTimeInterval(Double(arc4random_uniform(10) +  hideTime), target: self, selector: #selector(wafbasicViewController.showButton11), userInfo: nil, repeats: true )
        timer12a = NSTimer.scheduledTimerWithTimeInterval(Double(arc4random_uniform(10) +  hideTime), target: self, selector: #selector(wafbasicViewController.showButton12), userInfo: nil, repeats: true )
        timer20a = NSTimer.scheduledTimerWithTimeInterval(Double(arc4random_uniform(10) + hideTime), target: self, selector: #selector(wafbasicViewController.showButton20), userInfo: nil, repeats: true )
        timer21a = NSTimer.scheduledTimerWithTimeInterval(Double(arc4random_uniform(10) +  hideTime), target: self, selector: #selector(wafbasicViewController.showButton21), userInfo: nil, repeats: true )
        timer22a = NSTimer.scheduledTimerWithTimeInterval(Double(arc4random_uniform(10) +  hideTime), target: self, selector: #selector(wafbasicViewController.showButton22), userInfo: nil, repeats: true )
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PauseSegue" {
            let destination = segue.destinationViewController as! PauseViewController
            destination.modalPresentationStyle = .Popover
            let popoverPresentationController = destination.popoverPresentationController
            if let _popoverPresentationController = popoverPresentationController {
                _popoverPresentationController.sourceView = self.view
                _popoverPresentationController.sourceRect = CGRectMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds) , 0, 0)
                _popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirection.init(rawValue: 0)
            }
            
            destination.popoverPresentationController!.delegate = self
            destination.levelP = "\(level)"
            destination.scoreP = "\(score)"
        }
        
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }

}
    
    


