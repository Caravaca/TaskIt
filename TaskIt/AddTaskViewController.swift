//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by Antonio Caravaca Vega on 26/01/15.
//  Copyright (c) 2015 Antonio Caravaca Vega. All rights reserved.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subTaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    @IBAction func addTaskButtonPressed(sender: UIButton) {
        
        let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        
        let managedObjectContext = appDelegate.managedObjectContext
        
        let entityDescription = NSEntityDescription.entityForName("TaskModel", inManagedObjectContext: managedObjectContext!)
        
        let task = TaskModel(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext!)
        
        task.task = taskTextField.text
        task.subTask = subTaskTextField.text
        task.date = dueDatePicker.date
        task.isCompleted = false
        
        appDelegate.saveContext()
        
        var request = NSFetchRequest(entityName: "TaskModel")
        var error: NSError? = nil
        
        var results: NSArray = managedObjectContext!.executeFetchRequest(request, error: &error)!
        
        for res in results {
            println(res)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

}
