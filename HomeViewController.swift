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

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeViewController.orientationChanged), name: UIDeviceOrientationDidChangeNotification, object: nil)

        
    }
    
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
 
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


