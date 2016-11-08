//
//  faceDisplayImageView.swift
//  group8alpha
//
//  Created by Adam Thompson on 11/7/16.
//  Copyright © 2016 cs378. All rights reserved.
//

import UIKit

class faceDisplayImageView: UIImageView {

    override var bounds: CGRect{
        didSet {
            adjustContentMode()
        }
    }

    override var image : UIImage?{
        didSet{
            adjustContentMode()
        }
    }
    
    func adjustContentMode()
    {
        guard let image = image else{
            return
        }
        if image.size.width > bounds.size.width ||
            image.size.height > bounds.size.height{
            contentMode = .ScaleAspectFit
        } else {
            contentMode = .Center
        }
        
    }
}
