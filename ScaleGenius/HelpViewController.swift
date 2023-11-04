//
//  HelpViewController.swift
//  Smart Scales
//
//  Created by Jon Lee on 7/30/16.
//  Copyright © 2016 Jon Lee. All rights reserved.
//

import UIKit

class HelpViewController: UITableViewController {

    @IBOutlet var helpTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //set the ViewController title and background color of tableView
        self.title = "Guide"

        tableView.backgroundView = nil;
        tableView.backgroundColor = UIColor(red: 255/255, green: 250/255, blue: 242/255, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source


    /*** Configure sections and headers ***/
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        tableView.tableFooterView?.isHidden = true

        if section == 0 {
            return "Getting Started"
        }
        if section == 1 { return "Scale Exercises" }
        else { return "Songwriting Quick-Guide" }
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude+44
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {  return 1 }
        if section == 1 {  return 1 }
        if section == 2 {  return 6 }

        else { return 3 }
    }

    /*** Height of cell adjusts depending on contents ***/
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    /*** Get the contents for each cell ***/
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath)
                return cell

        }
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "exerciseCell", for: indexPath)
            return cell
        }

        else {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "progressionCell", for: indexPath)
                return cell
            }
            if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "chartCell", for: indexPath)
                return cell
            }
            if indexPath.row == 2 {
                //retrieve the custom cell
                let cell = tableView.dequeueReusableCell(withIdentifier: "chordsCell", for: indexPath)  as! chordsCell
                return cell
            }
            if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "COFCell", for: indexPath)
                return cell
            }
            if indexPath.row == 4 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "COFChartCell", for: indexPath)
                return cell
            }
            if indexPath.row == 5 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "conclusionCell", for: indexPath)
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "chartCell", for: indexPath)
                return cell
            }
        }

    }

  }
