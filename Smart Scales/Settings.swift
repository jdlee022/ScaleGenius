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
    let notesArr = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"]
    var notesToDisplay = [""]
    //variables used in notesToBeDisplayed()
    var rootIndex = 0
    var secondIndex = 0
    var thirdIndex = 0
    var fourthIndex = 0
    var fifthIndex = 0
    var sixthIndex = 0
    var seventhIndex = 0
    
    
    //Retrieve values from NSUserDefaults
    var Key: String {
        // save myKey with NSUserDefault
        if let myLoadedString = NSUserDefaults.standardUserDefaults().stringForKey("KeyString") {
            return myLoadedString
        }
        else { return "C" }
    }
    var Scale: String {
        // save myScale with NSUserDefault
        if let myLoadedString = NSUserDefaults.standardUserDefaults().stringForKey("ScaleString") {
            return myLoadedString
        }
        else { return "Major" }
        
    }
    
    //???????
    var Tuning: [Int] {
        if let myTuningData = NSUserDefaults.standardUserDefaults().objectForKey("tuning") as? NSData {
            return NSKeyedUnarchiver.unarchiveObjectWithData(myTuningData) as! [Int]
        }
        else { return [7, 0, 5, 10, 2, 7] }
        
    }
 
    
    
    
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
    
    //compute notes to be displayed on the fretboard
    func computeNotesToDisplay() ->[String] {
        tableView.reloadData()
        print("values in Settings:")
        print(Key)
        print(Scale)
        print(Tuning)
        
        //determine notes for MAJOR scale
        if Scale == "Major"{
            rootIndex = notesArr.indexOf(Key)!
            secondIndex = (notesArr.indexOf(Key)! + 2) % 12
            thirdIndex = (notesArr.indexOf(Key)! + 4) % 12
            fourthIndex = (notesArr.indexOf(Key)! + 5) % 12
            fifthIndex = (notesArr.indexOf(Key)! + 7) % 12
            sixthIndex = (notesArr.indexOf(Key)! + 9) % 12
            seventhIndex = (notesArr.indexOf(Key)! + 11) % 12
            notesToDisplay = [notesArr[rootIndex], notesArr[secondIndex], notesArr[thirdIndex], notesArr[fourthIndex], notesArr[fifthIndex], notesArr[sixthIndex], notesArr[seventhIndex]]
        }
        //determine notes for MAJOR PENTATONIC scale
        if Scale == "Major Pentatonic" {
            rootIndex = notesArr.indexOf(Key)!
            secondIndex = (notesArr.indexOf(Key)! + 2) % 12
            thirdIndex = (notesArr.indexOf(Key)! + 4) % 12
            //fourthIndex = (notesArr.indexOf(Key)! + 5) % 12
            fifthIndex = (notesArr.indexOf(Key)! + 7) % 12
            sixthIndex = (notesArr.indexOf(Key)! + 9) % 12
            //seventhIndex = (notesArr.indexOf(Key)! + 11) % 12
            notesToDisplay = [notesArr[rootIndex], notesArr[secondIndex], notesArr[thirdIndex], notesArr[fifthIndex], notesArr[sixthIndex]]
        }
        //determine notes for MINOR scale
        if Scale == "Minor" {
            rootIndex = notesArr.indexOf(Key)!
            secondIndex = (notesArr.indexOf(Key)! + 2) % 12
            thirdIndex = (notesArr.indexOf(Key)! + 3) % 12
            fourthIndex = (notesArr.indexOf(Key)! + 5) % 12
            fifthIndex = (notesArr.indexOf(Key)! + 7) % 12
            sixthIndex = (notesArr.indexOf(Key)! + 8) % 12
            seventhIndex = (notesArr.indexOf(Key)! + 10) % 12
            notesToDisplay = [notesArr[rootIndex], notesArr[secondIndex], notesArr[thirdIndex], notesArr[fourthIndex], notesArr[fifthIndex], notesArr[sixthIndex], notesArr[seventhIndex]]
        }
        
        print("notes to be displayed: \(notesToDisplay)")
        return notesToDisplay
    }
    
    //debugger button (delete later)
    @IBAction func testButton(sender: AnyObject) {
        computeNotesToDisplay()
    }

    
}