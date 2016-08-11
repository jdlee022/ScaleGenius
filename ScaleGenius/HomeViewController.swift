//
//  HomeViewController.swift
//  Smart Scales
//
//  Created by Jon Lee on 7/20/16.
//  Copyright © 2016 Jon Lee. All rights reserved.
//

import UIKit

protocol OrientationDelegate: class {
    func orientationChanged()
}

class HomeViewController: UIViewController, UIScrollViewDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var fretboardView: FretboardView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    weak var delegate: OrientationDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a multi-line title
        let label = UILabel(frame: CGRectMake(0, 0, 44, 44))
        label.backgroundColor = UIColor.clearColor()
        label.numberOfLines = 2
        label.textAlignment = NSTextAlignment.Center
        label.text = "Key: \(SettingsHelper.Key)\nScale: \(SettingsHelper.Scale)"
        self.navigationItem.titleView = label
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        delegate = fretboardView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        //update fretboard appearance when view loads
        self.fretboardView.setNeedsDisplay()
        // Create a multi-line title
        let label = UILabel(frame: CGRectMake(0, 0, 20, 70))
        label.backgroundColor = UIColor.clearColor()
        label.numberOfLines = 2
        label.textAlignment = NSTextAlignment.Center
        label.text = "Key: \(SettingsHelper.Key)\nScale: \(SettingsHelper.Scale)"
        self.navigationItem.titleView = label
        
        //notifies us when the orientation of the phone changes
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeViewController.orientationChanged), name: UIDeviceOrientationDidChangeNotification, object: nil)
        
        //determine whether autolock is enabled
        if SettingsHelper.switchState == "Off" {
            UIApplication.sharedApplication().idleTimerDisabled = false
        }
        else { UIApplication.sharedApplication().idleTimerDisabled = true }
        
        
    }
    
    //the function is redefined in FretboardView.swift and called whenever the phone orientation changes
    func orientationChanged()
    {
        delegate.orientationChanged()
    }
    
    
    //lock in portrait mode
    override func shouldAutorotate() -> Bool {
        return false
    }
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    func navigationControllerSupportedInterfaceOrientations(navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    
}