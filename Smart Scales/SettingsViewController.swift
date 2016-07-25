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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //add additional code
    }
 
    /*
    //debugger button (delete later)
    @IBAction func testButton(sender: AnyObject) {
        tableView.reloadData()
        //computeNotesToDisplay()
        //print(notesToDisplay)
        print("SETTINGSHELPER VALUES:")
        print(SettingsHelper.Key)
        print(SettingsHelper.Scale)
        print("notesToDisplay: \(SettingsHelper.notesToDisplay)")
        print("first string arr: \(SettingsHelper.firstString)")
        print("sixth string arr: \(SettingsHelper.sixthString)")

    }
 */

    
}