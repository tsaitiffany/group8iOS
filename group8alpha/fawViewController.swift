//
//  fawViewController.swift
//  group8alpha
//
//  Created by Eder Garza on 11/11/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit

class fawViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var gameOver: UILabel!
    
    var seconds:Int = 10
    var hideTimer = NSTimer();
    
    //buttons
    
    
    @IBOutlet weak var bTL: UIButton!
    @IBOutlet weak var bTM: UIButton!
    @IBOutlet weak var bTR: UIButton!
    @IBOutlet weak var bML: UIButton!
    @IBOutlet weak var bmid: UIButton!
    @IBOutlet weak var bMR: UIButton!
    @IBOutlet weak var bBL: UIButton!
    @IBOutlet weak var bBM: UIButton!
    @IBOutlet weak var bBR: UIButton!
    
    //2 timers for each button
    var timerTLa = NSTimer();
    var timerTLb = NSTimer();
    var timerTMa = NSTimer();
    var timerTMb = NSTimer();
    var timerTRa = NSTimer();
    var timerTRb = NSTimer();
    var timerMLa = NSTimer();
    var timerMLb = NSTimer();
    var timerMida = NSTimer();
    var timerMidb = NSTimer();
    var timerMRa = NSTimer();
    var timerMRb = NSTimer();
    var timerBLa = NSTimer();
    var timerBLb = NSTimer();
    var timerBMa = NSTimer();
    var timerBMb = NSTimer();
    var timerBRa = NSTimer();
    var timerBRb = NSTimer();
    
    //time in seconds
    var hideTime:UInt32 = 1
    var showTime:Double = 1.0
    
    var result:Int = 0
    var lost:Bool = false
    
    @IBAction func TL(sender: UIButton)
    {
        if(bTL.hidden == false)
        {
            addPoints()
        }
    }
    
    @IBAction func TM(sender: UIButton)
    {
        if(bTM.hidden == false)
        {
            addPoints()
        }
    }
    
    @IBAction func TR(sender: UIButton)
    {
        if(bTR.hidden == false)
        {
            addPoints()
        }
    }
    
    @IBAction func ML(sender: UIButton)
    {
        if(bML.hidden == false)
        {
            addPoints()
        }
    }
    
    @IBAction func mid(sender: UIButton)
    {
        if(bmid.hidden == false)
        {
            addPoints()
        }
    }
    
    @IBAction func MR(sender: UIButton)
    {
        if(bMR.hidden == false)
        {
            addPoints()
        }
    }
    
    @IBAction func BL(sender: UIButton)
    {
        if(bBL.hidden == false)
        {
            addPoints()
        }
    }
    
    @IBAction func BM(sender: UIButton)
    {
        if(bBM.hidden == false)
        {
            addPoints()
        }
    }
    
    @IBAction func BR(sender: UIButton)
    {
        if(bBR.hidden == false)
        {
            addPoints()
        }
    }
    
    @IBOutlet weak var score: UILabel!
    
    func addPoints()
    {
        if(seconds > 0)
        {
            result += 100
        }
        
        score.text = String(result)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        gameOver.text = ""
        score.text = String(result)
        runGame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // sets game state to run, start button timers
    func runGame()
    {
        bTL.hidden = true
        bTM.hidden = true
        bTR.hidden = true
        bML.hidden = true
        bmid.hidden = true
        bMR.hidden = true
        bBL.hidden = true
        bBM.hidden = true
        bBR.hidden = true
        
        hideTimer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(fawViewController.changeShow), userInfo: nil, repeats: true)
    }
    
    //selector functions for timers
    func showButtonTL()
    {
        bTL.hidden = false
    }
    
    func hideButtonTL()
    {
        if(bTL.hidden == false)
        {
            bTL.hidden = true
        }
    }
    
    func showButtonTM()
    {
        bTM.hidden = false
    }
    
    func hideButtonTM()
    {
        if(bTM.hidden == false)
        {
            bTM.hidden = true
        }
    }
    
    func showButtonTR()
    {
        bTR.hidden = false
    }
    
    func hideButtonTR()
    {
        if(bTR.hidden == false)
        {
            bTR.hidden = true
        }
    }
    
    func showButtonML()
    {
        bML.hidden = false
    }
    
    func hideButtonML()
    {
        if(bML.hidden == false)
        {
            bML.hidden = true
        }
    }
    
    func showButtonMid()
    {
        bmid.hidden = false
    }
    
    func hideButtonMid()
    {
        if(bmid.hidden == false)
        {
            bmid.hidden = true
        }
    }
    
    func showButtonMR()
    {
        bMR.hidden = false
    }
    
    func hideButtonMR()
    {
        if(bMR.hidden == false)
        {
            bMR.hidden = true
        }
    }
    
    func showButtonBL()
    {
        bBL.hidden = false
    }
    
    func hideButtonBL()
    {
        if(bBL.hidden == false)
        {
            bBL.hidden = true
        }
    }
    
    func showButtonBM()
    {
        bBM.hidden = false
    }
    
    func hideButtonBM()
    {
        if(bBM.hidden == false)
        {
            bBM.hidden = true
        }
    }
    
    func showButtonBR()
    {
        bBR.hidden = false
    }
    
    func hideButtonBR()
    {
        bBR.hidden = true
    }
    
    //updates showTime and timers
    func changeShow()
    {
        seconds -= 1
        
        if(seconds <= 0)
        {
            hideTimer.invalidate()
            hideButtons()
            gameOver.text = "Game Over!"
        }
            
        else
        {
            
        timerTLb = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(fawViewController.hideButtonTL), userInfo: nil, repeats: false)
        timerTMb = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(fawViewController.hideButtonTM), userInfo: nil, repeats: false)
        timerTRb = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(fawViewController.hideButtonTR), userInfo: nil, repeats: false)
        timerMLb = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(fawViewController.hideButtonML), userInfo: nil, repeats: false)
        timerMidb = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(fawViewController.hideButtonMid), userInfo: nil, repeats: false)
        timerMRb = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(fawViewController.hideButtonMR), userInfo: nil, repeats: false)
        timerBLb = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(fawViewController.hideButtonBL), userInfo: nil, repeats: false)
        timerBMb = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(fawViewController.hideButtonBM), userInfo: nil, repeats: false)
        timerBRb = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(fawViewController.hideButtonBR), userInfo: nil, repeats: false)
        
            changeHide()
        }
    }
    
    func hideButtons()
    {
        bTL.setBackgroundImage(nil, forState: UIControlState.Normal)
        bTM.setBackgroundImage(nil, forState: UIControlState.Normal)
        bTR.setBackgroundImage(nil, forState: UIControlState.Normal)
        bML.setBackgroundImage(nil, forState: UIControlState.Normal)
        bmid.setBackgroundImage(nil, forState: UIControlState.Normal)
        bMR.setBackgroundImage(nil, forState: UIControlState.Normal)
        bBL.setBackgroundImage(nil, forState: UIControlState.Normal)
        bBM.setBackgroundImage(nil, forState: UIControlState.Normal)
        bBR.setBackgroundImage(nil, forState: UIControlState.Normal)
    }
    
    //updates timers to change to new hideTime
    func changeHide()
    {
            timerTLa = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(fawViewController.showButtonTL), userInfo: nil, repeats: false )
            timerTMa = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(fawViewController.showButtonTM), userInfo: nil, repeats: false )
            timerTRa = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(fawViewController.showButtonTR), userInfo: nil, repeats: false )
            timerMLa = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(fawViewController.showButtonML), userInfo: nil, repeats: false)
            timerMida = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(fawViewController.showButtonMid), userInfo: nil, repeats: false)
            timerMRa = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(fawViewController.showButtonMR), userInfo: nil, repeats: false)
            timerBLa = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(fawViewController.showButtonBL), userInfo: nil, repeats: false)
            timerBMa = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(fawViewController.showButtonBM), userInfo: nil, repeats: false)
            timerBRa = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(fawViewController.showButtonBR), userInfo: nil, repeats: false)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "GameOver"
        {
            let destination = segue.destinationViewController as! FinishedViewController
            destination.modalPresentationStyle = .Popover
            let popoverPresentationController = destination.popoverPresentationController
            if let _popoverPresentationController = popoverPresentationController {
                _popoverPresentationController.sourceView = self.view
                _popoverPresentationController.sourceRect = CGRectMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds) , 0, 0)
                _popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirection.init(rawValue: 0)
            }
            
            destination.popoverPresentationController!.delegate = self
            destination.result = "\(result)"
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return UIModalPresentationStyle.None
    }
}
