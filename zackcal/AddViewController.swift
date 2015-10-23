//
//  AddViewController.swift
//  zackcal
//
//  Created by Zackary Moore on 10/11/15.
//  Copyright (c) 2015 Zackary Moore. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var EventDate: UIDatePicker!
    @IBOutlet weak var EventTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SaveButtonPressed(sender: UIButton) {
        var newEvent = CalendarEvent();
        newEvent.Title = EventTitle.text;
        newEvent.Date = EventDate.date;
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDateString = dateFormatter.stringFromDate(newEvent.Date);
        
        if(eventList[newDateString] == nil)
        {
            eventList[newDateString] = [CalendarEvent]();
        }
        
        eventList[newDateString]!.append(newEvent);
        self.dismissViewControllerAnimated(false, completion: nil);
    }
    
    @IBAction func CancelButtonPressed(sender: UIButton) {
        self.dismissViewControllerAnimated(false, completion: nil);
    }
}

