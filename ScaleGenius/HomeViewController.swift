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
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 2
        label.textAlignment = NSTextAlignment.center
        label.text = "Key: \(SettingsHelper.Key)\nScale: \(SettingsHelper.Scale)"
        self.navigationItem.titleView = label

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        delegate = fretboardView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        //update fretboard appearance when view loads
        self.fretboardView.setNeedsDisplay()
        // Create a multi-line title
        let label = UILabel(frame: CGRectMake(0, 0, 20, 70))
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 2
        label.textAlignment = NSTextAlignment.center
        label.text = "Key: \(SettingsHelper.Key)\nScale: \(SettingsHelper.Scale)"
        self.navigationItem.titleView = label

        //notifies us when the orientation of the phone changes
        NotificationCenter.default.addObserver(self, selector: #selector(HomeViewController.orientationChanged), name: UIDevice.orientationDidChangeNotification, object: nil)

        //determine whether autolock is enabled
        if SettingsHelper.switchState == "Off" {
            UIApplication.shared.isIdleTimerDisabled = false
        }
        else { UIApplication.shared.isIdleTimerDisabled = true }


    }

    //the function is redefined in FretboardView.swift and called whenever the phone orientation changes
    @objc func orientationChanged()
    {
        delegate.orientationChanged()
    }


    //lock in portrait mode
    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        .portrait
    }

}
