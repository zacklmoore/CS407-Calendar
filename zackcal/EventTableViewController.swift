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
        
        if(eventList[todayString] != nil)
        {
            todayEvents = eventList[todayString]!;
            todayEvents.sort({ (e1: CalendarEvent, e2: CalendarEvent) -> Bool in
                
                if e1.Date.compare(e2.Date) == NSComparisonResult.OrderedAscending
                {
                    return true;
                }
                return false;
            });
        }
        else
        {
            todayEvents = [CalendarEvent]();
        }
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
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh:mm a";
        let timeString = dateFormatter.stringFromDate(event.Date);
        cell.EventTime.text = timeString;
        cell.EventTitle.text = event.Title;
        
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        let todayDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let todayString = dateFormatter.stringFromDate(todayDate);

        if(eventList[todayString] != nil)
        {
            todayEvents = eventList[todayString]!;
            todayEvents.sort({ (e1: CalendarEvent, e2: CalendarEvent) -> Bool in
                
                if e1.Date.compare(e2.Date) == NSComparisonResult.OrderedAscending
                {
                    return true;
                }
                return false;
            });
        }
        else
        {
            todayEvents = [CalendarEvent]();
        }
        tableView.reloadData();
    }
}
