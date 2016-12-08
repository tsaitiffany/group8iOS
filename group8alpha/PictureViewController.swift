//
//  PictureViewController.swift
//  group8alpha
//
//  Created by Adam Thompson on 11/7/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit
import CoreData

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    //A queue to save the image without freezing the UI
    let saveQueue = dispatch_queue_create("saveQueue", DISPATCH_QUEUE_CONCURRENT)
    //The managed object context for saving the image to
    let managedContext = AppDelegate().managedObjectContext
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func photoLibraryAction(sender: AnyObject) {
        let picker = UIImagePickerController()
                picker.delegate = self
                picker.sourceType = .PhotoLibrary
        
                presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func cameraAction(sender: AnyObject) {
        let picker = UIImagePickerController()
                picker.delegate = self
                picker.sourceType = .Camera
        
                presentViewController(picker, animated: true, completion: nil)
    }
    
    
    //rescales images to passed size
    func scale(imageToResize :UIImage, toSize newSize:CGSize) -> UIImage{
        let aspectFill = resizeFill(imageToResize.size, toSize : newSize)
        
        UIGraphicsBeginImageContextWithOptions(aspectFill, false, 0.0)
        imageToResize.drawInRect(CGRectMake(0, 0, aspectFill.width, aspectFill.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func resizeFill(fromSize : CGSize, toSize : CGSize) -> CGSize{
        let aspectOne = fromSize.height / fromSize.width
        let aspectTwo = toSize.height / toSize.width
        
        let scale : CGFloat
        
        if aspectOne < aspectTwo {
            scale = fromSize.height / toSize.height
        } else {
            scale = fromSize.width / toSize.width
        }
        
        let newHeight = fromSize.height / scale
        let newWidth = fromSize.width / scale
        
        return CGSize(width: newWidth, height: newHeight)
        
        
    }
    
    func prepareForImageSaving(image : UIImage) {
        let date : Double = NSDate().timeIntervalSince1970
        
        dispatch_async(saveQueue){
            guard let imageData = UIImageJPEGRepresentation(image, 1) else {
                print("jpeg error")
                return
            }
        
            //scales image
            let thumbnail = self.scale(image, toSize: self.view.frame.size)
        
            guard let thumbnailData = UIImageJPEGRepresentation(thumbnail, 0.7) else {
                print("jpeg error")
                return
            }
            
            self.saveImage(imageData, thumbnailData: thumbnailData, date: date)
        }
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        imageView.image = scale((info[UIImagePickerControllerOriginalImage] as? UIImage)!, toSize : imageView.frame.size)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func saveImage(imageData:NSData, thumbnailData:NSData, date:Double){
        dispatch_barrier_async(saveQueue){
            guard let fullRes = NSEntityDescription.insertNewObjectForEntityForName("FullRes", inManagedObjectContext: self.managedContext) as? FullRes,
                let thumbnail = NSEntityDescription.insertNewObjectForEntityForName("Thumbnail", inManagedObjectContext: self.managedContext) as? Thumbnail else {
                    print("moc error")
                    return
            }
            
            fullRes.imageData = imageData
            
            thumbnail.imageData = thumbnailData
            thumbnail.id = date as NSNumber
            
            thumbnail.fullRes = fullRes
            
            do {
                try self.managedContext.save()
            } catch {
                fatalError("Failure to save context: \(error)")
            }
            
            self.managedContext.refreshAllObjects()
        }
    }
    
    @IBAction func finishPickingImage(sender: UIButton) {
       prepareForImageSaving(imageView.image!)
    }
    
    
}

