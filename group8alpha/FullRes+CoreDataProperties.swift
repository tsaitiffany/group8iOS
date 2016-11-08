//
//  FullRes+CoreDataProperties.swift
//  group8alpha
//
//  Created by Adam Thompson on 11/7/16.
//  Copyright © 2016 cs378. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension FullRes {

    @NSManaged var imageData: NSData?
    @NSManaged var thumbnail: Thumbnail?

}
