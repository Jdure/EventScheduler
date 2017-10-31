//
//  Schedule.swift
//  BuildEventSchedule
//
//  Created by Robson Strabeli de Camargo Miranda on 2017-09-21.
//  Copyright © 2017 stra015@algonquinlive.com. All rights reserved.
//
/*
Step 3:
Create the Schedule class in the Schedule.swift file

Add a variable called eventArray of type Event array
Add a get-only Int called eventCount, use a guard statement to check if isEmpty is false on the array, else return 0.  If the guard passes return the array's count value.
Create an addNewEvent function that takes in 3 String parameters called title, description and dateString. Append a new Event object to the array using these values within this function.
Create a function called outputAllEvents that take sno arguments, and returns a string.  Use a guard to check if the isEmpty is false on the array, else return an error message.  If the guard passes, then loop through the eventArray array concatenating the String data returned from each event's getInfo function to a new formatted string, and return that string
*/

import Foundation

//Class Schedule to deal with events created
class Schedule {
    
    //Array to store event Objects
    var eventArray = Array<Event>();
    
    //Method to return how many events stored
    var eventCount: Int {
        guard !eventArray.isEmpty else { return 0 }
        return eventArray.count
    }

    //Method to add new events according to the schedule
    func addNewEvent(title:String, description:String, dateString:String){
        
        let newEvent = Event(title: title, description: description, dateString: dateString)
        self.eventArray.append(newEvent)
        
    }

    func addNewEvent(title:String, description:String, date:Date){
        
        let newEvent = Event(title: title, description: description, date: date)
        self.eventArray.append(newEvent)
        
    }

    func addNewEvent(newEvent:Event){

        self.eventArray.append(newEvent)
    }

    func removeEvent(index:Int){
        
        self.eventArray.remove(at: index)
    }

    //Method to output the entire list of events user has scheduled
    func outputAllEvents() -> String{
        guard !self.eventArray.isEmpty else {
            return "Error: You have no Events created."
        }
        
        var returnText: String = "";
        for (v) in self.eventArray {
            
            returnText += v.getInfo()
            returnText += "\n"
            
        }
        
        return returnText
        
    }
    
    //Method to return eventArray
    func getSchedule() -> Array<Event> {
        return self.eventArray
    }
    
    
}
