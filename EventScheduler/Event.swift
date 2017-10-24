//
//  Event.swift
//  BuildEventSchedule
//
//  Created by Robson Strabeli de Camargo Miranda on 2017-09-21.
//  Copyright © 2017 stra015@algonquinlive.com. All rights reserved.
//

//import class to user Date formatting
import Foundation

//Class Event to store user's events
class Event {
    
    //Required variables created
    var title: String?
    var description: String?
    var date: Date?
    
    //Format Date variables
    let formatting = DateFormatter()
    let stringDateFormat = "yyyy/MM/dd HH:mm"

    //init method to create new events
    init(title:String, description:String) {
        
        self.title = title
        self.description = description
    }
    
    convenience init(title:String, description:String, dateString:String) {
        self.init(title: title, description: description)
        self.setDate(formatedDateString: dateString)
    }
    
    //Set Date from String to Date format
    func setDate(formatedDateString: String){
        formatting.dateFormat = self.stringDateFormat
        self.date = formatting.date(from: formatedDateString)
    }
    
    //return information from event. Set default value for date
    func getInfo() -> String{
        
        formatting.dateFormat = self.stringDateFormat

        if self.date == nil {
            self.setDate(formatedDateString: "1900/01/01 00:00")
        }
        
        return "Event: \(self.title ?? "")\nDate: \(formatting.string(from: self.date!))\nDescription: \(self.description ?? "")\n"
        
    }
    
}
