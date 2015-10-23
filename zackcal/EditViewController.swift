//
//  EditViewController.swift
//  zackcal
//
//  Created by Zackary Moore on 10/11/15.
//  Copyright (c) 2015 Zackary Moore. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateSelect: UIDatePicker!
    
    var todayEvents: [CalendarEvent] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let todayDate = dateSelect.date;
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let todayString = dateFormatter.stringFromDate(todayDate);
        
        if(eventList[todayString] != nil)
        {
            todayEvents = eventList[todayString]!;
        }
        else
        {
            todayEvents = [CalendarEvent]();
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        let todayDate = dateSelect.date;
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let todayString = dateFormatter.stringFromDate(todayDate);
        
        if(eventList[todayString] != nil)
        {
            todayEvents = eventList[todayString]!;
        }
        else
        {
            todayEvents = [CalendarEvent]();
        }

        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        tableView.editing = false;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todayEvents.count;
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("EventEditTableViewCell", forIndexPath: indexPath) as! EventEditTableViewCell
        let event = todayEvents[indexPath.row];
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh:mm a";
        let timeString = dateFormatter.stringFromDate(event.Date);
        cell.EventTime.text = timeString;
        cell.EventTitle.text = event.Title;
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            todayEvents.removeAtIndex(indexPath.row)
            let todayDate = dateSelect.date;
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let todayString = dateFormatter.stringFromDate(todayDate)
            eventList[todayString] = todayEvents;
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    @IBAction func dateChanged(sender: UIDatePicker) {
        let todayDate = dateSelect.date;
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let todayString = dateFormatter.stringFromDate(todayDate);
        
        if(eventList[todayString] != nil)
        {
            todayEvents = eventList[todayString]!;
        }
        else
        {
            todayEvents = [CalendarEvent]();
        }
        
        tableView.reloadData()
    }
    
    
    
    
}

