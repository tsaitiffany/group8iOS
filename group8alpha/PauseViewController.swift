//
//  PauseViewController.swift
//  group8alpha
//
//  Created by Adam Thompson on 10/26/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit

class PauseViewController: UIViewController{
    
    @IBOutlet weak var scoreVal: UILabel!
    @IBOutlet weak var levelVal: UILabel!

    var levelP = "1"
    var scoreP = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelVal.text = levelP
        scoreVal.text = scoreP
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
