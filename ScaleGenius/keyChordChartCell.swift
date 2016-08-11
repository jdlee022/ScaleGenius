//
//  keyChordChartCell.swift
//  ScaleGenius
//
//  Created by Jon Lee on 8/9/16.
//  Copyright © 2016 Jon Lee. All rights reserved.
//

import UIKit

class keyChordChartCell: UITableViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView!.frame = CGRectMake(0, 0, 200, 400)
    }

}
