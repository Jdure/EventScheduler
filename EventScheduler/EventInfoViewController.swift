//
//  ViewController.swift
//  EventScheduler
//
//  Created by Robson Strabeli de Camargo Miranda on 2017-10-24.
//  Copyright © 2017 stra015@algonquinlive.com. All rights reserved.
//

import UIKit

class EventInfoViewController: UIViewController {

    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Do any additional setup after loading the view.

        if let e = event {
            eventTitle.text = e.title
            eventDate.text = e.stringDateFormat
            eventDescription.text = e.description
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

