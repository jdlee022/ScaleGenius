//
//  HelpViewController.swift
//  Smart Scales
//
//  Created by Jon Lee on 7/30/16.
//  Copyright © 2016 Jon Lee. All rights reserved.
//

import UIKit

class HelpViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    /*
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
        }
        if indexPath.row == 1 {

            return UITableViewAutomaticDimension
        }
        else { return UITableViewAutomaticDimension }
    }
 */
 


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
 
    
    
    //give each section a title
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Getting Started"
        }
        if section == 1 { return "Scale Exercises" }
        else {
            return "Songwriting Quick-Guide"
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {  return 1 }
        if section == 1 {  return 1 }

        else { return 0 }
    }


    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCellWithIdentifier("infoCell", forIndexPath: indexPath)
                return cell
            
        }
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("exerciseCell", forIndexPath: indexPath)
            return cell
        }
            
            
        else {
            //delete this and add code for second section
            let cell = tableView.dequeueReusableCellWithIdentifier("COFCell", forIndexPath: indexPath)
            return cell
        }
        
    }
 
 

  }
