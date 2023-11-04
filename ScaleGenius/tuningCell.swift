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


    //save myTuningIndex using NSUSerDefaults
    var myTuningIndex: [Int] {
        get {
            let myTuningIndex: [Int]
            if let myTuningData = UserDefaults.standard.object(forKey: "tuning") as? NSData, let index = NSKeyedUnarchiver.unarchiveObject(with: myTuningData as Data) as? [Int] {
                myTuningIndex = index

            } else {
                //default values if nothing was stored with NSUserDefaults
                myTuningIndex = [7, 0, 5, 10, 2, 7]
                do {
                    let myTuningData = try NSKeyedArchiver.archivedData(withRootObject: myTuningIndex, requiringSecureCoding: true)
                    UserDefaults.standard.set(myTuningData, forKey: "tuning")
                } catch {
                    print(error.localizedDescription)
                }
            }

            return myTuningIndex
        }
        set {
            do {
                let mytuningData = try NSKeyedArchiver.archivedData(withRootObject: newValue, requiringSecureCoding: true)
                UserDefaults.standard.set(mytuningData, forKey: "tuning")
            } catch {
                print(error.localizedDescription)
            }
        }
    }



    //called in Settings.swift when displaying contents of the cell
    func updateTuning() {

        //print(myTuningIndex)

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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tuneArr.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tuneArr[row]
    }

    //need 6 components for 6 strings
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 6
    }

    //set the note values for each string (aka the tuning)
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        //get values used to save picker indices
        var index = myTuningIndex
        index[component] = row
        myTuningIndex = index

    }

}
