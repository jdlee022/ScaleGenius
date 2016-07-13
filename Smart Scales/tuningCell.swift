//
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
    
    var tuneArr = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"]
    //variables to store the tuning
    var string1Tune = ""
    var string2Tune = ""
    var string3Tune = ""
    var string4Tune = ""
    var string5Tune = ""
    var string6Tune = ""
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tuningPicker.delegate = self
        tuningPicker.dataSource = self
        tuningPicker.selectRow(7, inComponent: 0, animated: true)
        tuningPicker.selectRow(0, inComponent: 1, animated: true)
        tuningPicker.selectRow(5, inComponent: 2, animated: true)
        tuningPicker.selectRow(10, inComponent: 3, animated: true)
        tuningPicker.selectRow(2, inComponent: 4, animated: true)
        tuningPicker.selectRow(7, inComponent: 5, animated: true)
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
        if component == 0 {
            string1Tune = tuneArr[row]
        }
        if component == 1 {
            string2Tune = tuneArr[row]
        }
        if component == 2 {
            string3Tune = tuneArr[row]
        }
        if component == 3 {
            string4Tune = tuneArr[row]
        }
        if component == 4 {
            string5Tune = tuneArr[row]
        }
        if component == 5 {
            string6Tune = tuneArr[row]
        }
        print(string1Tune)
        print(string2Tune)
        print(string3Tune)
        print(string4Tune)
        print(string5Tune)
        print(string6Tune)
        
    }

}
