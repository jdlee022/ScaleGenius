//  SettingsHelper.swift
//  Smart Scales
//
//  Created by Jon Lee on 7/19/16.
//  Copyright © 2016 Jon Lee. All rights reserved.


import Foundation

/****** THIS CLASS RETRIEVES VALUES FROM NSUSERDEFAULTS AND SETS STATIC VARIABLES REPRESENTING THE CURRENT LAYOUT OF THE FRETBOARD ******/
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
    static var switchState: String {
        
        // get value from NSUserDefaults
        if let myLoadedString = NSUserDefaults.standardUserDefaults().stringForKey("switchState") {
            return myLoadedString
        }
        else { return "On" }
    }
    
    //Retrieve values from NSUserDefaults
    static var intervalState: String {

        // get value from NSUserDefaults
        if let myLoadedString = NSUserDefaults.standardUserDefaults().stringForKey("intervalState") {
            return myLoadedString
        }
        else { return "Off" }
    }
    
    //Retrieve values from NSUserDefaults
    static var Key: String {
        
        // save Key with NSUserDefault
        if let myLoadedString = NSUserDefaults.standardUserDefaults().stringForKey("KeyString") {
            return myLoadedString
        }
        else { return "C" }
    }
    
    // get value from NSUserDefaults
    static var Scale: String {
        // save myScale with NSUserDefault
        if let myLoadedString = NSUserDefaults.standardUserDefaults().stringForKey("ScaleString") {
            return myLoadedString
        }
        else { return "Major" }
        
    }
    
    //the integers refer to the index of notesArr and correspond to each of the 6 strings
    static var TuningIndex: [Int] {
        if let myTuningData = NSUserDefaults.standardUserDefaults().objectForKey("tuning") as? NSData {
            return NSKeyedUnarchiver.unarchiveObjectWithData(myTuningData) as! [Int]
        }
        else { return [7, 0, 5, 10, 2, 7] }
        
    }
    
    //retrieve array with checked rows (highlighted intervals) from NSUserDefaults
    static var CheckedRows: [Int] {
        if let getArr = NSUserDefaults.standardUserDefaults().objectForKey("myCheckedArr") as? [Int] {
            return getArr
        }
        else { return [0] }
    }
    
    
    
    //Create a tuple of the notes to display on the fretboard and their corresponding interval #
    static var notesToDisplay: [(String, Int)] {
        
        
        //determine notes for MAJOR scale
        if Scale == "Major (Ionian)"{
            rootIndex = notesArr.indexOf(Key)!
            secondIndex = (notesArr.indexOf(Key)! + 2) % 12
            thirdIndex = (notesArr.indexOf(Key)! + 4) % 12
            fourthIndex = (notesArr.indexOf(Key)! + 5) % 12
            fifthIndex = (notesArr.indexOf(Key)! + 7) % 12
            sixthIndex = (notesArr.indexOf(Key)! + 9) % 12
            seventhIndex = (notesArr.indexOf(Key)! + 11) % 12
            return [(notesArr[rootIndex], 0), (notesArr[secondIndex], 1), (notesArr[thirdIndex], 2), (notesArr[fourthIndex], 3), (notesArr[fifthIndex], 4), (notesArr[sixthIndex], 5), (notesArr[seventhIndex], 6)]
        }
        //determine notes for MINOR scale
        if Scale == "Minor (Aeolian)" {
            rootIndex = notesArr.indexOf(Key)!
            secondIndex = (notesArr.indexOf(Key)! + 2) % 12
            thirdIndex = (notesArr.indexOf(Key)! + 3) % 12
            fourthIndex = (notesArr.indexOf(Key)! + 5) % 12
            fifthIndex = (notesArr.indexOf(Key)! + 7) % 12
            sixthIndex = (notesArr.indexOf(Key)! + 8) % 12
            seventhIndex = (notesArr.indexOf(Key)! + 10) % 12
            return [(notesArr[rootIndex], 0), (notesArr[secondIndex], 1), (notesArr[thirdIndex], 2), (notesArr[fourthIndex], 3), (notesArr[fifthIndex], 4), (notesArr[sixthIndex], 5), (notesArr[seventhIndex], 6)]
        }
        if Scale == "Dorian"{
            rootIndex = notesArr.indexOf(Key)!
            secondIndex = (notesArr.indexOf(Key)! + 2) % 12
            thirdIndex = (notesArr.indexOf(Key)! + 3) % 12
            fourthIndex = (notesArr.indexOf(Key)! + 5) % 12
            fifthIndex = (notesArr.indexOf(Key)! + 7) % 12
            sixthIndex = (notesArr.indexOf(Key)! + 9) % 12
            seventhIndex = (notesArr.indexOf(Key)! + 10) % 12
            return [(notesArr[rootIndex], 0), (notesArr[secondIndex], 1), (notesArr[thirdIndex], 2), (notesArr[fourthIndex], 3), (notesArr[fifthIndex], 4), (notesArr[sixthIndex], 5), (notesArr[seventhIndex], 6)]
        }
        if Scale == "Phrygian"{
            rootIndex = notesArr.indexOf(Key)!
            secondIndex = (notesArr.indexOf(Key)! + 1) % 12
            thirdIndex = (notesArr.indexOf(Key)! + 3) % 12
            fourthIndex = (notesArr.indexOf(Key)! + 5) % 12
            fifthIndex = (notesArr.indexOf(Key)! + 7) % 12
            sixthIndex = (notesArr.indexOf(Key)! + 8) % 12
            seventhIndex = (notesArr.indexOf(Key)! + 10) % 12
            return [(notesArr[rootIndex], 0), (notesArr[secondIndex], 1), (notesArr[thirdIndex], 2), (notesArr[fourthIndex], 3), (notesArr[fifthIndex], 4), (notesArr[sixthIndex], 5), (notesArr[seventhIndex], 6)]
        }
        if Scale == "Lydian"{
            rootIndex = notesArr.indexOf(Key)!
            secondIndex = (notesArr.indexOf(Key)! + 2) % 12
            thirdIndex = (notesArr.indexOf(Key)! + 4) % 12
            fourthIndex = (notesArr.indexOf(Key)! + 6) % 12
            fifthIndex = (notesArr.indexOf(Key)! + 7) % 12
            sixthIndex = (notesArr.indexOf(Key)! + 9) % 12
            seventhIndex = (notesArr.indexOf(Key)! + 11) % 12
            return [(notesArr[rootIndex], 0), (notesArr[secondIndex], 1), (notesArr[thirdIndex], 2), (notesArr[fourthIndex], 3), (notesArr[fifthIndex], 4), (notesArr[sixthIndex], 5), (notesArr[seventhIndex], 6)]
        }
        if Scale == "Mixolydian"{
            rootIndex = notesArr.indexOf(Key)!
            secondIndex = (notesArr.indexOf(Key)! + 2) % 12
            thirdIndex = (notesArr.indexOf(Key)! + 4) % 12
            fourthIndex = (notesArr.indexOf(Key)! + 5) % 12
            fifthIndex = (notesArr.indexOf(Key)! + 7) % 12
            sixthIndex = (notesArr.indexOf(Key)! + 9) % 12
            seventhIndex = (notesArr.indexOf(Key)! + 10) % 12
            return [(notesArr[rootIndex], 0), (notesArr[secondIndex], 1), (notesArr[thirdIndex], 2), (notesArr[fourthIndex], 3), (notesArr[fifthIndex], 4), (notesArr[sixthIndex], 5), (notesArr[seventhIndex], 6)]
        }
        if Scale == "Locrian"{
            rootIndex = notesArr.indexOf(Key)!
            secondIndex = (notesArr.indexOf(Key)! + 1) % 12
            thirdIndex = (notesArr.indexOf(Key)! + 3) % 12
            fourthIndex = (notesArr.indexOf(Key)! + 5) % 12
            fifthIndex = (notesArr.indexOf(Key)! + 6) % 12
            sixthIndex = (notesArr.indexOf(Key)! + 8) % 12
            seventhIndex = (notesArr.indexOf(Key)! + 10) % 12
            return [(notesArr[rootIndex], 0), (notesArr[secondIndex], 1), (notesArr[thirdIndex], 2), (notesArr[fourthIndex], 3), (notesArr[fifthIndex], 4), (notesArr[sixthIndex], 5), (notesArr[seventhIndex], 6)]
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
            return [(notesArr[rootIndex], 0), (notesArr[secondIndex], 1), (notesArr[thirdIndex], 2), (notesArr[fifthIndex], 4), (notesArr[sixthIndex], 5)]
        }
        if Scale == "Minor Pentatonic" {
            rootIndex = notesArr.indexOf(Key)!
            secondIndex = (notesArr.indexOf(Key)! + 3) % 12
            thirdIndex = (notesArr.indexOf(Key)! + 5) % 12
            //fourthIndex = (notesArr.indexOf(Key)! + 5) % 12
            fifthIndex = (notesArr.indexOf(Key)! + 7) % 12
            sixthIndex = (notesArr.indexOf(Key)! + 10) % 12
            //seventhIndex = (notesArr.indexOf(Key)! + 10) % 12
            return [(notesArr[rootIndex], 0), (notesArr[secondIndex], 1), (notesArr[thirdIndex], 2), (notesArr[fifthIndex], 4), (notesArr[sixthIndex], 5)]
        }
        if Scale == "Harmonic Minor" {
            rootIndex = notesArr.indexOf(Key)!
            secondIndex = (notesArr.indexOf(Key)! + 2) % 12
            thirdIndex = (notesArr.indexOf(Key)! + 3) % 12
            fourthIndex = (notesArr.indexOf(Key)! + 5) % 12
            fifthIndex = (notesArr.indexOf(Key)! + 7) % 12
            sixthIndex = (notesArr.indexOf(Key)! + 8) % 12
            seventhIndex = (notesArr.indexOf(Key)! + 11) % 12
            return [(notesArr[rootIndex], 0), (notesArr[secondIndex], 1), (notesArr[thirdIndex], 2), (notesArr[fourthIndex], 3), (notesArr[fifthIndex], 4), (notesArr[sixthIndex], 5), (notesArr[seventhIndex], 6)]
        }
        if Scale == "Melodic Minor" {
            rootIndex = notesArr.indexOf(Key)!
            secondIndex = (notesArr.indexOf(Key)! + 2) % 12
            thirdIndex = (notesArr.indexOf(Key)! + 3) % 12
            fourthIndex = (notesArr.indexOf(Key)! + 5) % 12
            fifthIndex = (notesArr.indexOf(Key)! + 7) % 12
            sixthIndex = (notesArr.indexOf(Key)! + 9) % 12
            seventhIndex = (notesArr.indexOf(Key)! + 11) % 12
            return [(notesArr[rootIndex], 0), (notesArr[secondIndex], 1), (notesArr[thirdIndex], 2), (notesArr[fourthIndex], 3), (notesArr[fifthIndex], 4), (notesArr[sixthIndex], 5), (notesArr[seventhIndex], 6)]
        }
        if Scale == "Blues (minor)" {
            rootIndex = notesArr.indexOf(Key)!
            secondIndex = (notesArr.indexOf(Key)! + 3) % 12
            thirdIndex = (notesArr.indexOf(Key)! + 5) % 12
            fourthIndex = (notesArr.indexOf(Key)! + 6) % 12
            fifthIndex = (notesArr.indexOf(Key)! + 7) % 12
            sixthIndex = (notesArr.indexOf(Key)! + 10) % 12
            //seventhIndex = (notesArr.indexOf(Key)! + 10) % 12
            return [(notesArr[rootIndex], 0), (notesArr[secondIndex], 1), (notesArr[thirdIndex], 2), (notesArr[fourthIndex], 3), (notesArr[fifthIndex], 4), (notesArr[sixthIndex], 5)]
        }
        //if no scale was selected (first time app is run) display Major Scale
        else {
            rootIndex = notesArr.indexOf(Key)!
            secondIndex = (notesArr.indexOf(Key)! + 2) % 12
            thirdIndex = (notesArr.indexOf(Key)! + 4) % 12
            fourthIndex = (notesArr.indexOf(Key)! + 5) % 12
            fifthIndex = (notesArr.indexOf(Key)! + 7) % 12
            sixthIndex = (notesArr.indexOf(Key)! + 9) % 12
            seventhIndex = (notesArr.indexOf(Key)! + 11) % 12
            return [(notesArr[rootIndex], 0), (notesArr[secondIndex], 1), (notesArr[thirdIndex], 2), (notesArr[fourthIndex], 3), (notesArr[fifthIndex], 4), (notesArr[sixthIndex], 5), (notesArr[seventhIndex], 6)]
        }
        
    }
    
    

 
    /************ initialize arrays for all 6 strings (adjusts for tuning) *************/
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
