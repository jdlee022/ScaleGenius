//  SettingsHelper.swift
//  Smart Scales
//
//  Created by Jon Lee on 7/19/16.
//  Copyright © 2016 Jon Lee. All rights reserved.

/*********** IMPORTANT STATIC VARIABLES ***********

 SettingsHelper.notesArr
 SettingsHelper.Key
 SettingsHelper.Scale
 
 SettingsHelper.notesToDisplay
 SettingsHelper.firstString
 SettingsHelper.secondString   (... up to sixthString)
 
 *********** IMPORTANT STATIC VARIABLES ***********/

import Foundation

class SettingsHelper {
    
    static let notesArr = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"]
    
    //variables used in notesToBeDisplayed()
    static var rootIndex = 0
    static var secondIndex = 0
    static var thirdIndex = 0
    static var fourthIndex = 0
    static var fifthIndex = 0
    static var sixthIndex = 0
    static var seventhIndex = 0

    
    //Retrieve values from NSUserDefaults
    static var Key: String {
        
        // save Key with NSUserDefault
        if let myLoadedString = NSUserDefaults.standardUserDefaults().stringForKey("KeyString") {
            return myLoadedString
        }
        else { return "C" }
    }
    static var Scale: String {
        // save myScale with NSUserDefault
        if let myLoadedString = NSUserDefaults.standardUserDefaults().stringForKey("ScaleString") {
            return myLoadedString
        }
        else { return "Major" }
        
    }
    
    static var TuningIndex: [Int] {
        if let myTuningData = NSUserDefaults.standardUserDefaults().objectForKey("tuning") as? NSData {
            return NSKeyedUnarchiver.unarchiveObjectWithData(myTuningData) as! [Int]
        }
        else { return [7, 0, 5, 10, 2, 7] }
        
    }
    
    
    static var notesToDisplay: [String] {
        
        //determine notes for MAJOR scale
        if Scale == "Major"{
            rootIndex = notesArr.indexOf(Key)!
            secondIndex = (notesArr.indexOf(Key)! + 2) % 12
            thirdIndex = (notesArr.indexOf(Key)! + 4) % 12
            fourthIndex = (notesArr.indexOf(Key)! + 5) % 12
            fifthIndex = (notesArr.indexOf(Key)! + 7) % 12
            sixthIndex = (notesArr.indexOf(Key)! + 9) % 12
            seventhIndex = (notesArr.indexOf(Key)! + 11) % 12
            return [notesArr[rootIndex], notesArr[secondIndex], notesArr[thirdIndex], notesArr[fourthIndex], notesArr[fifthIndex], notesArr[sixthIndex], notesArr[seventhIndex]]
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
            return [notesArr[rootIndex], notesArr[secondIndex], notesArr[thirdIndex], notesArr[fifthIndex], notesArr[sixthIndex]]
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
            return [notesArr[rootIndex], notesArr[secondIndex], notesArr[thirdIndex], notesArr[fourthIndex], notesArr[fifthIndex], notesArr[sixthIndex], notesArr[seventhIndex]]
        }
        else { return ["error"] }
        
    }
    
    

 
    //************ initialize arrays for all 6 strings (adjusts for tuning) *************
    static var sixthString: [String] {
        var toBeReturned = [String](count:25, repeatedValue: "")
        var index = self.TuningIndex[0]
        for fret in 0...24{
            toBeReturned[fret] = self.notesArr[index]
            index = (index + 1)%12
        }
        return toBeReturned
    }
    static var fifthString: [String] {
        var toBeReturned = [String](count:25, repeatedValue: "")
        var index = self.TuningIndex[1]
        for fret in 0...24{
            toBeReturned[fret] = self.notesArr[index]
            index = (index + 1)%12
        }
        return toBeReturned
    }
    static var fourthString: [String] {
        var toBeReturned = [String](count:25, repeatedValue: "")
        var index = self.TuningIndex[2]
        for fret in 0...24{
            toBeReturned[fret] = self.notesArr[index]
            index = (index + 1)%12
        }
        return toBeReturned
    }
    static var thirdString: [String] {
        var toBeReturned = [String](count:25, repeatedValue: "")
        var index = self.TuningIndex[3]
        for fret in 0...24{
            toBeReturned[fret] = self.notesArr[index]
            index = (index + 1)%12
        }
        return toBeReturned
    }
    static var secondString: [String] {
        var toBeReturned = [String](count:25, repeatedValue: "")
        var index = self.TuningIndex[4]
        for fret in 0...24{
            toBeReturned[fret] = self.notesArr[index]
            index = (index + 1)%12
        }
        return toBeReturned
    }
    static var firstString: [String] {
        var toBeReturned = [String](count:25, repeatedValue: "")
        var index = self.TuningIndex[5]
        for fret in 0...24{
            toBeReturned[fret] = self.notesArr[index]
            index = (index + 1)%12
        }
        return toBeReturned
    }
    //************ finished: initialize arrays for all 6 strings (adjusts for tuning) *************


    
    
}
