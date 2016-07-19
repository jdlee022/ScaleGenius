//
//  FretboardView.swift
//  Smart Scales
//
//  Created by Jon Lee on 7/18/16.
//  Copyright © 2016 Jon Lee. All rights reserved.
//

import UIKit

@IBDesignable class FretboardView: UIView {

    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        rect.size.width
        rect.size.height
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, UIColor.purpleColor().CGColor)
        CGContextFillRect(context, rect)
        CGContextFillEllipseInRect(context, rect)
    }

}
