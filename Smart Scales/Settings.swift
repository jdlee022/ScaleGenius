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
    
    
    
    
    
    //how many rows for each section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    //contents of each cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //set contents of  keyCell
        if indexPath.row == 0 {
            let cell = self.tableView.dequeueReusableCellWithIdentifier("keyCell", forIndexPath: indexPath) as! keyCell
            cell.keyLabel.text = "Key"
            
            return cell
        }
        
        //set contents of scaleCell
        if indexPath.row == 1 {
            let cell = self.tableView.dequeueReusableCellWithIdentifier("scaleCell", forIndexPath: indexPath) as! scaleCell
            cell.scaleLabel.text = "Scale"
            
            return cell
        }
            
            //set contents of tuningCell
        else{
            let cell = self.tableView.dequeueReusableCellWithIdentifier("tuningCell", forIndexPath: indexPath) as! tuningCell
            cell.tuningLabel.text = "Tuning"
            
            return cell
        }
    }
    
    
    //number of sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //give each section a title
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Guitar Display"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //add additional code
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //add additional code
    }
    
}