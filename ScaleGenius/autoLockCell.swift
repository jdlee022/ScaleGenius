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
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //toggle autoLock on and off
    @IBAction func toggleAutolock(sender: UISwitch) {
        if sender.on {
            UIApplication.sharedApplication().idleTimerDisabled = true
            NSUserDefaults.standardUserDefaults().setObject("On", forKey: "switchState")
        }
        else {
            UIApplication.sharedApplication().idleTimerDisabled = false
            NSUserDefaults.standardUserDefaults().setObject("Off", forKey: "switchState")
        }
    }
}
