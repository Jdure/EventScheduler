//
//  ScheduleTableViewController.swift
//  EventScheduler
//
//  Created by Robson Strabeli de Camargo Miranda on 2017-10-26.
//  Copyright © 2017 stra015@algonquinlive.com. All rights reserved.
//

import UIKit

class ScheduleTableViewController: UITableViewController, EventPassingDelegate {

    //Schedule object instance
    let schedule = Schedule()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create three new Test Events
        schedule.addNewEvent(title: "Event 1", description: "This is a Test Event", dateString: "2017-09-21 01:55")
        schedule.addNewEvent(title: "Event 2", description: "This is another Test Event", dateString: "2017-09-30 02:12")
        schedule.addNewEvent(title: "Event 3", description: "Oh yeah, a new one", dateString: "2017-10-05 05:15")
        schedule.addNewEvent(title: "Event 4", description: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock", dateString: "2017-10-05 05:15")
    }

    //Use event count to set number of cells in the controller
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return schedule.eventCount
    }
    
    //Format cells and display events
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
        
        if let e = schedule.getSchedule()[indexPath.row].title {
            cell.textLabel?.numberOfLines = 2;
            cell.textLabel?.text = e + "\n" + schedule.getSchedule()[indexPath.row].getDate()
            cell.imageView?.image = UIImage(named: "clock.png")
            cell.imageView?.contentMode = UIViewContentMode.scaleAspectFill
        }
        
        return cell
    }
    
    //Implements Delete cell feature
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            schedule.removeEvent(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    //Set cell height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  64
    }
    
    //Set margin from the header
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }

    //Set margin from the footer
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    //Prepare data to be displayed on the segue views
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEventInfo" {
            let eventVC = segue.destination as? EventInfoViewController
            guard let cell = sender as? UITableViewCell,
                  let indexPath = tableView.indexPath(for: cell)
            else {
                    return
            }
            eventVC?.event = schedule.getSchedule()[indexPath.row]
        } else if segue.identifier == "addNewEvent" {
            let addNewEventVC = segue.destination as? NewEventViewController
            addNewEventVC?.delegate = self

        }
        
    }
    
    //Receive back the Event Created on the New Event View
    func passEventBack(event: Event) {
        schedule.addNewEvent(newEvent: event)
        self.tableView?.reloadData()
        print(schedule.outputAllEvents())

    }
    
    //Action for the New Event Button
    @IBAction func addNewEvent(_ sender: Any) {
    }
}
