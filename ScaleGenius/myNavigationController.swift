//
//  myNavigationController.swift
//  Smart Scales
//
//  Created by Jon Lee on 7/26/16.
//  Copyright © 2016 Jon Lee. All rights reserved.
//

import UIKit

class myNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the back button colors in navigation bar to match navigation items color
        UINavigationBar.appearance().tintColor = UIColor(red: 103/255, green: 47/255, blue:0/255, alpha: 1)
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        let homeVC = HomeViewController()
        return homeVC.supportedInterfaceOrientations()
    }
    
    override func shouldAutorotate() -> Bool {
        let homeVC = HomeViewController()
        return homeVC.shouldAutorotate()
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
