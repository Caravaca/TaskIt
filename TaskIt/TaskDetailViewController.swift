//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Antonio Caravaca Vega on 23/01/15.
//  Copyright (c) 2015 Antonio Caravaca Vega. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController, UITextFieldDelegate {
    
    var detailTaskModel: TaskModel!

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subTaskTextField: UITextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        taskTextField.delegate = self
        subTaskTextField.delegate = self
        
        taskTextField.text = detailTaskModel.task
        subTaskTextField.text = detailTaskModel.subTask
        dueDatePicker.date = detailTaskModel.date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
       self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func doneButtonPressed(sender: UIBarButtonItem) {
        
        let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        
        detailTaskModel.task = taskTextField.text
        detailTaskModel.subTask = subTaskTextField.text
        detailTaskModel.date = dueDatePicker.date
        detailTaskModel.isCompleted = detailTaskModel.isCompleted
        
        appDelegate.saveContext()
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        subTaskTextField.resignFirstResponder()
        taskTextField.resignFirstResponder()
        return true;
    }

    

}
