//
//  EventTableViewController.swift
//  zackcal
//
//  Created by Zackary Moore on 10/22/15.
//  Copyright (c) 2015 Zackary Moore. All rights reserved.
//

import UIKit

var eventList: [String:[CalendarEvent]] = [:];

class EventTableViewController: UITableViewController {
    
    var todayEvents: [CalendarEvent] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todayDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let todayString = dateFormatter.stringFromDate(todayDate);
        
        generateSampleEvents(todayString);
        
        todayEvents = eventList[todayString]!;
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todayEvents.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EventTableViewCell", forIndexPath: indexPath) as! EventTableViewCell
        let event = todayEvents[indexPath.row];
        
        cell.EventTime.text = "12:00am";
        cell.EventTitle.text = event.Title;
        
        return cell
    }
    
    func generateSampleEvents(today:String) {
        var event1 : CalendarEvent = CalendarEvent();
        event1.Title = "Test";
        event1.Date = NSDate();
        var event2 : CalendarEvent = CalendarEvent();
        event2.Title = "Test 2";
        event2.Date = NSDate();
        eventList[today] = [CalendarEvent]();
        eventList[today]!.append(event1);
        eventList[today]!.append(event2);
    }

}
