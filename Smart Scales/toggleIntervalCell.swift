//
//  toggleIntervalCell.swift
//  Smart Scales
//
//  Created by Jon Lee on 8/5/16.
//  Copyright © 2016 Jon Lee. All rights reserved.
//

import UIKit

class toggleIntervalCell: UITableViewCell {

    @IBOutlet weak var intervalSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if SettingsHelper.intervalState == "On" {
            intervalSwitch.setOn(true, animated: true)
        }
        else { intervalSwitch.setOn(false, animated: true) }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func toggleIntervalNums(sender: UISwitch) {
        if sender.on {
            UIApplication.sharedApplication().idleTimerDisabled = true
            NSUserDefaults.standardUserDefaults().setObject("On", forKey: "intervalState")
            print(SettingsHelper.intervalState)
        }
        else {
            UIApplication.sharedApplication().idleTimerDisabled = false
            NSUserDefaults.standardUserDefaults().setObject("Off", forKey: "intervalState")
            print(SettingsHelper.intervalState)
        }
    }
}
