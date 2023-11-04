//
//  scaleCell.swift
//  Smart Scales
//
//  Created by Jon Lee on 7/13/16.
//  Copyright © 2016 Jon Lee. All rights reserved.
//

import UIKit

class scaleCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var scaleLabel: UILabel!
    @IBOutlet weak var scalePicker: UIPickerView!

    let scaleArr = ["Major (Ionian)", "Minor (Aeolian)", "Dorian", "Phrygian", "Lydian", "Mixolydian", "Locrian", "Major Pentatonic", "Minor Pentatonic", "Harmonic Minor", "Melodic Minor", "Blues (minor)"]
    var myScale = "Major"
    var myScaleIndex = 0


    func updateScale() {

        //print(myScale)

        //set picker components corresponding to myTuningIndex settings
        let myScaleIndexData = UserDefaults.standard

        if (myScaleIndexData.value(forKey: "ScaleIndex") != nil){
            myScaleIndex = myScaleIndexData.value(forKey: "ScaleIndex") as! NSInteger
        }

        // save myScale with NSUserDefault
        if let myLoadedString = UserDefaults.standard.string(forKey: "ScaleString") {
            myScale = myLoadedString
        }

        scalePicker.selectRow(myScaleIndex, inComponent: 0, animated: true)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        scalePicker.delegate = self
        scalePicker.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return scaleArr.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return scaleArr[row]
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myScale = scaleArr[row]
        UserDefaults.standard.set(myScale, forKey: "ScaleString")

        myScaleIndex = NSInteger(row)
        let myScaleIndexData = UserDefaults.standard
        myScaleIndexData.set(row, forKey: "ScaleIndex")
        myScaleIndexData.synchronize()
    }

}
