//
//  HelpViewController.swift
//  Smart Scales
//
//  Created by Jon Lee on 7/30/16.
//  Copyright © 2016 Jon Lee. All rights reserved.
//

import UIKit

class HelpViewController: UITableViewController {

    @IBOutlet var helpTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //set the ViewController title and background color of tableView
        self.title = "Guide"

        tableView.backgroundView = nil;
        tableView.backgroundColor = UIColor(red: 213/255, green: 232/255, blue: 255/255, alpha: 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    

    /*** Configure sections and headers ***/
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        tableView.tableFooterView?.hidden = true

        if section == 0 {
            return "Getting Started"
        }
        if section == 1 { return "Scale Exercises" }
        else { return "Songwriting Quick-Guide" }
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.min+44
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {  return 1 }
        if section == 1 {  return 1 }
        if section == 2 {  return 6 }


        else { return 3 }
    }
    
    /*** Height of cell adjusts depending on contents ***/
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    /*** Get the contents for each cell ***/
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
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCellWithIdentifier("progressionCell", forIndexPath: indexPath)
                return cell
            }
            if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCellWithIdentifier("chartCell", forIndexPath: indexPath)
                return cell
            }
            if indexPath.row == 2 {
                //retrieve the custom cell
                let cell = tableView.dequeueReusableCellWithIdentifier("chordsCell", forIndexPath: indexPath) as! chordsCell
                return cell
            }
            if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCellWithIdentifier("COFCell", forIndexPath: indexPath)
                return cell
            }
            if indexPath.row == 4 {
                let cell = tableView.dequeueReusableCellWithIdentifier("COFChartCell", forIndexPath: indexPath)
                return cell
            }
            if indexPath.row == 5 {
                let cell = tableView.dequeueReusableCellWithIdentifier("conclusionCell", forIndexPath: indexPath)
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCellWithIdentifier("chartCell", forIndexPath: indexPath)
                
                return cell
            }
        }
        
    }

  }
