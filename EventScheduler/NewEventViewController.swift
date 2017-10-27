//
//  NewEventViewController.swift
//  EventScheduler
//
//  Created by Robson Strabeli de Camargo Miranda on 2017-10-26.
//  Copyright © 2017 stra015@algonquinlive.com. All rights reserved.
//

import UIKit

class NewEventViewController: UIViewController {

    @IBOutlet weak var eventTitle: UITextField!
    @IBOutlet weak var eventDescription: UITextView!
    @IBOutlet weak var eventDate: UIDatePicker!
    
    //Schedule object instance
    let schedule = Schedule();

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.eventDescription.layer.borderColor = UIColor(red:0.76, green:0.76, blue:0.76, alpha:0.4).cgColor
        self.eventDescription.layer.borderWidth = 1.0;
        self.eventDescription.layer.cornerRadius = 5.0;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Clear all fields on the screen and set focus on the first one
    func clearFields() {
        eventTitle.text = ""
        eventTitle.becomeFirstResponder()
    }
    

    // MARK: - Navigation
    @IBAction func btnSave(_ sender: Any) {
        //test if all required fields are filled
        if (!self.eventTitle.text!.isEmpty) && (!self.description.isEmpty)  {
            schedule.addNewEvent(title:self.title!, description:self.description, date:self.eventDate.date)
        } else {
            //Pop up message when one of the fields is not filled
            let alertController = UIAlertController(title: "Event Creation Error",
                                                    message: "All Fields are required",
                                                    preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        self.clearFields()
        
    }
    
    
}
