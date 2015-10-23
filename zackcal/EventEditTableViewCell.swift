//
//  EventEditTableViewCell.swift
//  zackcal
//
//  Created by Zackary Moore on 10/22/15.
//  Copyright (c) 2015 Zackary Moore. All rights reserved.
//

import UIKit

class EventEditTableViewCell: UITableViewCell {

    @IBOutlet weak var EventTitle: UILabel!
    @IBOutlet weak var EventTime: UILabel!
    
    @IBAction func editButtonPressed(sender: UIButton) {
        print("Editing Event: " + EventTitle.text!);
    }
}
