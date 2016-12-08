//
//  ManageFacesCollectionViewController.swift
//  
//
//  Created by Tiffany Tsai on 12/7/16.
//
//

import UIKit
import CoreData

class ManageFacesCollectionViewController: UICollectionViewController {
    let managedContext = AppDelegate().managedObjectContext
    var pictures :[UIImage]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = NSFetchRequest()
        let entityDescription = NSEntityDescription.entityForName("Thumbnail", inManagedObjectContext: self.managedContext)
        request.entity = entityDescription
        do{
            pictures = try self.managedContext.executeFetchRequest(request) as? [UIImage]
        } catch {
            let fetchError = error as NSError
            print("\(fetchError)")
        }
        
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Faces", forIndexPath: indexPath) as UICollectionViewCell
        
        let image = cell.viewWithTag(1) as! UIImageView
        
        image.image = pictures![indexPath.row]
        
        return cell
    }
}
