//
//  keyCell.swift
//  Smart Scales
//
//  Created by Jon Lee on 7/13/16.
//  Copyright © 2016 Jon Lee. All rights reserved.
//

import UIKit

class keyCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var keyPicker: UIPickerView!

    var keyArr = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"]

    var myKey = "C"
    var myKeyIndex = 3

    //sets the Key depending on the pickerview
    func updateKey() {

        //set picker components corresponding to myTuningIndex settings
        let myKeyIndexData = UserDefaults.standard


        // save myKey with NSUserDefault
        if let myLoadedString = UserDefaults.standard.string(forKey: "KeyString") {
            myKey = myLoadedString
        }
        else{ myKey = "C" }


        //get key row index from NSUserDefaults and set the current pickers row
        if (myKeyIndexData.value(forKey: "KeyIndex") != nil){
            myKeyIndex = myKeyIndexData.value(forKey: "KeyIndex") as! NSInteger
        }
        else{ myKeyIndex = 3 }

        keyPicker.selectRow(myKeyIndex, inComponent: 0, animated: true)
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        keyPicker.delegate = self
        keyPicker.dataSource = self
        keyPicker.selectRow(3, inComponent: 0, animated: true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    //set number of rows in picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return keyArr.count
    }

    //set the string for each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return keyArr[row]
    }

    //set number of columns in picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    //if a new row is selected update the variables and save to NSUserDefaults
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myKeyIndex = NSInteger(row)
        myKey = keyArr[myKeyIndex]

        //save myKey with NSUserDefaults
        let userdefaults = UserDefaults.standard
        userdefaults.set(myKey, forKey: "KeyString")
        userdefaults.set(row, forKey: "KeyIndex")
        userdefaults.synchronize()
    }

}
