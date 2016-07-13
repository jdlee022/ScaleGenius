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
    
    let scaleArr = ["Major", "Major Pentatonic", "Minor"]
    var Scale = ""
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        scalePicker.delegate = self
        scalePicker.dataSource = self
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return scaleArr.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return scaleArr[row]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Scale = scaleArr[row]
        print(Scale)
    }

}
