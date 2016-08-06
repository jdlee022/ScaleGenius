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
    let defaults = NSUserDefaults.standardUserDefaults()
    
    
    //number of sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    //give each section a title
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Fretboard Display"
        }
        if section == 1 {
            return "Replace Note With Interval Number"
        }
        if section == 2 {
            return "Highlighted Intervals"
        }
        else { return "Prevent Screen From Turning Off" }
    }
    
    //how many rows for each section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 3
        }
        if section == 2 {
            return intervals.count
        }
        else { return 1 }
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
                //retrieve the custom cell
                let cell = self.tableView.dequeueReusableCellWithIdentifier("keyCell", forIndexPath: indexPath) as! keyCell
                cell.keyLabel.text = "Key"
                cell.updateKey()
                return cell
            }
            
            //set contents of scaleCell
            if indexPath.row == 1 {
                //retrieve the custom cell
                let cell = self.tableView.dequeueReusableCellWithIdentifier("scaleCell", forIndexPath: indexPath) as! scaleCell
                cell.scaleLabel.text = "Scale"
                cell.updateScale()
                return cell
            }
                
                
                //set contents of tuningCell
            else{
                //retrieve the custom cell
                let cell = self.tableView.dequeueReusableCellWithIdentifier("tuningCell", forIndexPath: indexPath) as! tuningCell
                cell.tuningLabel.text = "Tuning"
                cell.updateTuning()
                return cell
            }
        }
        
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("toggleIntervalCell", forIndexPath: indexPath) as UITableViewCell
            
            return cell
        }
            
        //create cells for second section based on [intervals]
        if indexPath.section == 2 {
            let cell = UITableViewCell()
            if indexPath.row == 3 || indexPath.row == 6 {
                cell.textLabel?.text = "\(intervals[indexPath.row])   (N/A for Pentatonic)"
            }
            else { cell.textLabel?.text = intervals[indexPath.row] }
            //dont show selection animation
            cell.selectionStyle = .None
            
            //get array of checked rows from NSUserDefaults and set accessory type
            var checkedArr: [Int] {
                if let getArr = defaults.objectForKey("myCheckedArr") as? [Int] {
                    return getArr
                }
                else { return [0] }
            }
            if checkedArr.contains(indexPath.row) {
                cell.accessoryType = .Checkmark
            }
            else { cell.accessoryType = .None }
            
            
            return cell
        }
            
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("autoLockCell", forIndexPath: indexPath) as UITableViewCell
            
            return cell
        }
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 2 {
            //get current cell
            let selectedCell = tableView.cellForRowAtIndexPath(indexPath)
           
            //create new array that can be mutated
            var newcheckedArr = SettingsHelper.CheckedRows
            
            //append or remove row depending on whether it's already checked (in the array) change the accessoryType of current item and save the new array
            if SettingsHelper.CheckedRows.contains(indexPath.row) {
                newcheckedArr.removeAtIndex(newcheckedArr.indexOf(indexPath.row)!)
                selectedCell?.accessoryType = .None
                NSUserDefaults.standardUserDefaults().setObject(newcheckedArr, forKey: "myCheckedArr")
                NSUserDefaults.standardUserDefaults().synchronize()
            }
            else {
                newcheckedArr.append(indexPath.row)
                selectedCell?.accessoryType = .Checkmark
                NSUserDefaults.standardUserDefaults().setObject(newcheckedArr, forKey: "myCheckedArr")
                NSUserDefaults.standardUserDefaults().synchronize()
            }
            
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //add additional code
        self.tableView.contentInset = UIEdgeInsetsMake(44,0,0,0);
        
        tableView.backgroundView = nil;
        tableView.backgroundColor = UIColor(red: 255/255, green: 250/255, blue: 242/255, alpha: 1)
        
        
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