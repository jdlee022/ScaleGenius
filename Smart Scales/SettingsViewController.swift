//
//  Settings.swift
//  Smart Scales
//
//  Created by Jon Lee on 7/12/16.
//  Copyright © 2016 Jon Lee. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    let intervals = ["root", "2nd", "3rd", "4th", "5th", "6th", "7th"]
    
    //number of sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    //give each section a title
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Fretboard Display"
        }
        else {
            return "Highlighted Notes"
        }
    }
    
    //how many rows for each section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 3
        }
        else {
            return intervals.count
        }
    }
    
    //set the height for the cells depending on the section
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.section == 0) {
            return 210
        }
        // "Else"
        return 50
    }
    
    //contents of each cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //create cells for first section using custom cell classes
        if indexPath.section == 0 {
            //set contents of  keyCell
            if indexPath.row == 0 {
                let cell = self.tableView.dequeueReusableCellWithIdentifier("keyCell", forIndexPath: indexPath) as! keyCell
                cell.keyLabel.text = "Key"
                cell.updateKey()
                return cell
            }
            
            //set contents of scaleCell
            if indexPath.row == 1 {
                let cell = self.tableView.dequeueReusableCellWithIdentifier("scaleCell", forIndexPath: indexPath) as! scaleCell
                cell.scaleLabel.text = "Scale"
                cell.updateScale()
                return cell
            }
                
                
                //set contents of tuningCell
            else{
                let cell = self.tableView.dequeueReusableCellWithIdentifier("tuningCell", forIndexPath: indexPath) as! tuningCell
                cell.tuningLabel.text = "Tuning"
                cell.updateTuning()
                return cell
            }
        }
            
        //create cells for second section based on [intervals]
        else {
            let cell = UITableViewCell()
            cell.textLabel?.text = intervals[indexPath.row]
            return cell
            
        }
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            cell.accessoryType = .None
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            cell.accessoryType = .Checkmark
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //add additional code
        self.tableView.contentInset = UIEdgeInsetsMake(44,0,0,0);
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //add additional code
    }
    
    
}