//  tuningCell.swift
//  Smart Scales
//
//  Created by Jon Lee on 7/13/16.
//  Copyright © 2016 Jon Lee. All rights reserved.
//

import UIKit

class tuningCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var tuningLabel: UILabel!
    @IBOutlet weak var tuningPicker: UIPickerView!
    
    let tuneArr = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"]
    //variable to store the tuning
    var myTuning = ["E", "A", "D", "G", "B", "E"]

    var myTuningIndex: [Int] {
        get {
            let myTuningIndex: [Int]
            
            if let myTuningData = NSUserDefaults.standardUserDefaults().objectForKey("tuning") as? NSData, index = NSKeyedUnarchiver.unarchiveObjectWithData(myTuningData) as? [Int] {
                myTuningIndex = index
            } else {
                myTuningIndex = [7, 0, 5, 10, 2, 7]
                let myTuningData = NSKeyedArchiver.archivedDataWithRootObject(myTuningIndex)
                NSUserDefaults.standardUserDefaults().setObject(myTuningData, forKey: "tuning")
            }
            
            return myTuningIndex
        }
        set {
            let myTuningData = NSKeyedArchiver.archivedDataWithRootObject(newValue)
            NSUserDefaults.standardUserDefaults().setObject(myTuningData, forKey: "tuning")
        }
    }
    
    //called in Settings.swift when displaying contents of the cell
    func update() {
        
        print(myTuningIndex)
        //set picker components corresponding to myTuningIndex settings
        for index in 0...5 {
            tuningPicker.selectRow(myTuningIndex[index], inComponent: index, animated: true)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tuningPicker.delegate = self
        tuningPicker.dataSource = self
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tuneArr.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tuneArr[row]
    }
    
    //need 6 components for 6 strings
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 6
    }
    
    //set the note values for each string (aka the tuning)
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var index = myTuningIndex
        myTuning[component] = tuneArr[row]
        index[component] = row
        myTuningIndex = index
        
        //update arrays depending on picker
        print(myTuning)
        print(myTuningIndex)
    }

}
