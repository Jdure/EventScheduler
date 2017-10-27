//
//  ScheduleTableViewController.swift
//  EventScheduler
//
//  Created by Robson Strabeli de Camargo Miranda on 2017-10-26.
//  Copyright © 2017 stra015@algonquinlive.com. All rights reserved.
//

import UIKit

class ScheduleTableViewController: UITableViewController {

    //Schedule object instance
    let schedule = Schedule()

    override func viewDidLoad() {
        super.viewDidLoad()

        schedule.addNewEvent(title: "Test 1", description: "This is a Test Event", dateString: "2017-09-21 01:55")
        schedule.addNewEvent(title: "Test 2", description: "This is another Test Event", dateString: "2017-09-30 02:12")
        schedule.addNewEvent(title: "Test 3", description: "Oh yeah, a new one", dateString: "2017-10-05 05:15")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return schedule.eventCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
        
        if let e = schedule.getSchedule()[indexPath.row].title {
            cell.textLabel?.text = e
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "showEventInfo" {
                    let eventVC = segue.destination as? EventInfoViewController
                    guard let cell = sender as? UITableViewCell,
                          let indexPath = tableView.indexPath(for: cell)
                    else {
                            return
                    }
                    eventVC?.event = schedule.getSchedule()[indexPath.row]
                }
    }
    
}
