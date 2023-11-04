//
//  autoLockCell.swift
//  Smart Scales
//
//  Created by Jon Lee on 8/1/16.
//  Copyright © 2016 Jon Lee. All rights reserved.
//

import UIKit

class autoLockCell: UITableViewCell {


    @IBOutlet weak var mySwitch: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if SettingsHelper.switchState == "On" {
            mySwitch.setOn(true, animated: true)
        }
        else { mySwitch.setOn(false, animated: true) }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //toggle autoLock on and off
    @IBAction func toggleAutolock(sender: UISwitch) {
        if sender.isOn {
            UIApplication.shared.isIdleTimerDisabled = true
            UserDefaults.standard.set("On", forKey: "switchState")
        }
        else {
            UIApplication.shared.isIdleTimerDisabled = false
            UserDefaults.standard.set("Off", forKey: "switchState")
        }
    }
}
