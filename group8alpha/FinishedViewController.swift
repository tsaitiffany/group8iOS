//
//  FinishedViewController.swift
//  group8alpha
//
//  Created by Eder Garza on 11/11/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {
    
    @IBOutlet weak var score: UILabel!
    
    var result = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        score.text = result
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
