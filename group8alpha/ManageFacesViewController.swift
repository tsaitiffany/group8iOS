//
//  ManageFacesViewController.swift
//  group8alpha
//
//  Created by Tiffany Tsai on 12/7/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit
import CoreData

class ManageFacesViewController: UIViewController {
    let managedContext = AppDelegate().managedObjectContext
    let request = NSFetchRequest(entityName : "Fullres")
    
    override func viewDidLoad()
    {
        guard let pictures : [UIImage] = managedContext.executeFetchRequest(request) else
        {
            print("Error retrieving pictures")
            return
        }
        
        
        
    }

}
