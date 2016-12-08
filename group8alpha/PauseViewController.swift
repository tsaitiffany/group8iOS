//
//  PauseViewController.swift
//  group8alpha
//
//  Created by Adam Thompson on 10/26/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit

class PauseViewController: UIViewController
{
    
    @IBOutlet weak var scoreVal: UILabel!
    @IBOutlet weak var levelVal: UILabel!

    var levelP = "1"
    var scoreP = "0"
    var miss = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelVal.text = levelP
        scoreVal.text = scoreP
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ReturnToBasic" {
            let destination = segue.destinationViewController as! wafbasicViewController
            //            destination.modalPresentationStyle = .Popover
            //            let popoverPresentationController = destination.popoverPresentationController
            //            if let _popoverPresentationController = popoverPresentationController {
            //                _popoverPresentationController.sourceView = self.view
            //                _popoverPresentationController.sourceRect = CGRectMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds) , 0, 0)
            //                _popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirection.init(rawValue: 0)
            //            }
            //
            //            destination.popoverPresentationController!.delegate = self
            destination.level = Int(levelP)!
            destination.score = Int(scoreP)!
            destination.miss = miss
            destination.running = true;
        }
        if segue.identifier == "ReturnToStretch" {
            let destination = segue.destinationViewController as! StretchViewController
            //            destination.modalPresentationStyle = .Popover
            //            let popoverPresentationController = destination.popoverPresentationController
            //            if let _popoverPresentationController = popoverPresentationController {
            //                _popoverPresentationController.sourceView = self.view
            //                _popoverPresentationController.sourceRect = CGRectMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds) , 0, 0)
            //                _popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirection.init(rawValue: 0)
            //            }
            //
            //            destination.popoverPresentationController!.delegate = self
            destination.level = Int(levelP)!
            destination.score = Int(scoreP)!
        }
    }
}
