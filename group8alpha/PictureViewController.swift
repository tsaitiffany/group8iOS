//
//  PictureViewController.swift
//  group8alpha
//
//  Created by Adam Thompson on 11/7/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit
import AVFoundation

class PictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func photoLibraryAction(sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .PhotoLibrary
        
        presentViewController(picker, animated: true, completion: nil)
        
    }
    
    @IBAction func cameraAction(sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .Camera
        
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func setProfileImage(imageToResize: UIImage, onImageView: UIImageView) -> UIImage{
        let width = imageToResize.size.width
        let height = imageToResize.size.height
        
        var scaleFactor : CGFloat
        
        if(width > height){
            scaleFactor = onImageView.frame.size.height/height
        }
        else{
            scaleFactor = onImageView.frame.size.width/width
        }
        
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(width * scaleFactor, height * scaleFactor), false, 0.0)
        imageToResize.drawInRect(CGRectMake(0, 0, width * scaleFactor, height * scaleFactor))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imageView.image = setProfileImage((info[UIImagePickerControllerOriginalImage] as? UIImage)!, onImageView: imageView)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}

