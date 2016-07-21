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
        
        //draw fretboard rectangle
        let rectangle = CGRectMake(rect.width/8,rect.height/26,rect.width*6/8, rect.height*24/26)
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextAddRect(context, rectangle)
        CGContextFillRect(context, rectangle)
        CGContextStrokePath(context)
        
        //set pen color to black
        CGContextSetLineWidth(context, 6.0)
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        
        //draw top line
        CGContextMoveToPoint(context, rect.width/8, rect.height/26)
        CGContextAddLineToPoint(context, rect.width*7/8, rect.height/26)
        CGContextStrokePath(context)
        
        
        //draw 6 strings
        for stringNum in 1...6 {
            CGContextSetLineWidth(context, 3.0)
            CGContextMoveToPoint(context, rect.width*CGFloat(Double(stringNum)+0.5)/8, rect.height/26)
            CGContextAddLineToPoint(context, rect.width*CGFloat(Double(stringNum)+0.5)/8, rect.height*25/26)
            CGContextStrokePath(context)
        }
        
        //draw 24 frets
        for fretNum in 2...25 {
            CGContextMoveToPoint(context, rect.width*1/8, rect.height*CGFloat(fretNum)/26)
            CGContextAddLineToPoint(context, rect.width*7/8, rect.height*CGFloat(fretNum)/26)
            CGContextStrokePath(context)
        }
        
        //draw circle
        CGContextSetLineWidth(context, 2.0)
        CGContextSetStrokeColorWithColor(context,
                                         UIColor.blueColor().CGColor)
        let noteIcon = CGRectMake(rect.width*0.75/7,rect.height*1.25/26,rect.width*0.5/7,rect.height*0.5/26)
        CGContextAddEllipseInRect(context, noteIcon)
        CGContextStrokePath(context)
        
        
        
        
        
        
        //draw circle with text in center
        let font: UIFont = UIFont(name: "Helvetica Neue", size: 40)!
        
        for string in 1...6{
            for fret in 0...23 {

                    let noteImage = UIUtility.circleImageWithText(text: SettingsHelper.sixthString[fret], font: font, circleColor: UIColor.blackColor())

                
                
                //height changes based on fret position
                let testRect = CGRectMake(rect.width*CGFloat(Double(string)+0.1)/8, rect.height*CGFloat(Double(fret)+0.2)/26, rect.width*0.8/8, rect.height*0.6/26)
                //flip the image upside-down and drawInRect
                UIGraphicsPushContext(context!)
                noteImage.drawInRect(testRect)
                UIGraphicsPopContext()
            }
        }
        
        
        
        
    }
    

}

