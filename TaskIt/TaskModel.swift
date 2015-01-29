//
//  TaskModel.swift
//  TaskIt
//
//  Created by Antonio Caravaca Vega on 28/01/15.
//  Copyright (c) 2015 Antonio Caravaca Vega. All rights reserved.
//

import Foundation
import CoreData

@objc(TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var date: NSDate
    @NSManaged var isCompleted: NSNumber
    @NSManaged var subTask: String
    @NSManaged var task: String

}
