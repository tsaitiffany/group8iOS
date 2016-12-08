//
//  ViewController.swift
//  group8alpha
//
//  Created by Eder Garza on 10/23/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var logoutBtn: UIButton!
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let user = FIRAuth.auth()?.currentUser
        {
            self.logoutBtn.alpha = 1.0
        }
        else
        {
            self.logoutBtn.alpha = 0.0
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func createAccBtn(sender: AnyObject) {
            if self.emailField.text == "" || self.passwordField.text == ""
            {
                let alertController = UIAlertController(title: "Oops!", message: "Please enter an email and password.", preferredStyle: .Alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.presentViewController(alertController, animated: true, completion: nil)
            }
                
            else
            {
                FIRAuth.auth()?.createUserWithEmail(self.emailField.text!, password: self.passwordField.text!) { (user, error) in
                    
                    if error == nil
                    {
                        self.logoutBtn.alpha = 1.0
                        self.emailField.text = ""
                        self.passwordField.text = ""
                    }
                    else
                    {
                        let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .Alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        
                        self.presentViewController(alertController, animated: true, completion: nil)
                    }
                    
            }
        }
    }

    @IBAction func loginBtn(sender: AnyObject) {
        if self.emailField.text == "" || self.passwordField.text == ""
        {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email and password.", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else
        {
            FIRAuth.auth()?.signInWithEmail(self.emailField.text!, password: self.passwordField.text!) { (user, error) in
                
                if error == nil
                {
                    self.logoutBtn.alpha = 1.0
                    self.emailField.text = ""
                    self.passwordField.text = ""
                }
                else
                {
                    let alertController = UIAlertController(title: "Oops!", message: error?.localizedDescription, preferredStyle: .Alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
                
            }
        }
    }
    
    @IBAction func logoutBtnAction(sender: AnyObject) {
    }

}

