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
    
    
    func updateKey() {
        
        //print(myKey)
        
        //set picker components corresponding to myTuningIndex settings
        let myKeyIndexData = NSUserDefaults.standardUserDefaults()
        
        if (myKeyIndexData.valueForKey("KeyIndex") != nil){
        myKeyIndex = myKeyIndexData.valueForKey("KeyIndex") as! NSInteger!
        }
        else{ myKeyIndex = 3 }
        
        // save myKey with NSUserDefault
        if let myLoadedString = NSUserDefaults.standardUserDefaults().stringForKey("KeyString") {
            myKey = myLoadedString
        }
        else{ myKey = "C" }

        keyPicker.selectRow(myKeyIndex, inComponent: 0, animated: true)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        keyPicker.delegate = self
        keyPicker.dataSource = self
        keyPicker.selectRow(3, inComponent: 0, animated: true)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return keyArr.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return keyArr[row]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myKeyIndex = NSInteger(row)
        myKey = keyArr[myKeyIndex]
        
        //save myKey with NSUserDefaults
        NSUserDefaults.standardUserDefaults().setObject(myKey, forKey: "KeyString")
        let myKeyIndexData = NSUserDefaults.standardUserDefaults()
        myKeyIndexData.setInteger(row, forKey: "KeyIndex")
        myKeyIndexData.synchronize()        
    }

}
