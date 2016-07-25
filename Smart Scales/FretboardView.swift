//
//  FretboardView.swift
//  Smart Scales
//
//  Created by Jon Lee on 7/18/16.
//  Copyright © 2016 Jon Lee. All rights reserved.
//

import UIKit
@IBDesignable class FretboardView: UIView {
    
    //redraw the view whenever the orientation is changed
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setNeedsDisplay()
    }
    
    //height and width change depending on orientation
    var height = CGFloat(0)
    var width = CGFloat(0)
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        //change height and width depending on orientation
        if UIDevice.currentDevice().orientation == .Portrait || UIDevice.currentDevice().orientation == .PortraitUpsideDown{
            print("portrait view")
            height = rect.height
            width = rect.width
        }
        if UIDevice.currentDevice().orientation == .LandscapeLeft || UIDevice.currentDevice().orientation == .LandscapeRight {
            print("landscape view")
            //height = rect.width
            //width = rect.height
            height = rect.height
            width = rect.width
        }
        
        let context = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, UIColor.purpleColor().CGColor)
        CGContextFillRect(context, rect)
        CGContextFillEllipseInRect(context, rect)
        
        //draw fretboard rectangle
        let rectangle = CGRectMake(width/8,height/26,width*6/8, height*24/26)
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextAddRect(context, rectangle)
        CGContextFillRect(context, rectangle)
        CGContextStrokePath(context)
        
        //set pen color to black
        CGContextSetLineWidth(context, 6.0)
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        
        //draw top line (nut of fretboard)
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
        
        
        
        /***** DRAW NOTE ICONS *****/
        let font: UIFont = UIFont(name: "Helvetica Neue", size: 40)!
        
        for string in 0...6{
            for fret in 0...24 {
                
                //Change dimensions to adjust for portrait view
                if UIDevice.currentDevice().orientation == .Portrait || UIDevice.currentDevice().orientation == .PortraitUpsideDown{
                    //use this transparent default image if the note should not be displayed
                    var noteImage = UIUtility.circleImageWithText(text: "", font: font, circleColor: UIColor.blackColor().colorWithAlphaComponent(0.0))
                    //draw fret numbers with clear background color
                    if string == 0{
                        if fret != 0 {
                            noteImage = UIUtility.circleImageWithText(text: String(fret), font: font, circleColor: UIColor.clearColor())
                        }
                    }
                    //draw notes on strings if they are contained in [notesToDisplay] or if 0th fret
                    if string == 1{
                        if SettingsHelper.notesToDisplay.contains(SettingsHelper.sixthString[fret]) || fret == 0 {
                            noteImage = UIUtility.circleImageWithText(text: SettingsHelper.sixthString[fret], font: font, circleColor: UIColor.blueColor())
                        }
                    }
                    if string == 2{
                        if SettingsHelper.notesToDisplay.contains(SettingsHelper.fifthString[fret]) || fret == 0 {
                            noteImage = UIUtility.circleImageWithText(text: SettingsHelper.fifthString[fret], font: font, circleColor: UIColor.blackColor())
                        }
                    }
                    if string == 3{
                        if SettingsHelper.notesToDisplay.contains(SettingsHelper.fourthString[fret]) || fret == 0 {
                            noteImage = UIUtility.circleImageWithText(text: SettingsHelper.fourthString[fret], font: font, circleColor: UIColor.blackColor())
                        }
                    }
                    if string == 4{
                        if SettingsHelper.notesToDisplay.contains(SettingsHelper.thirdString[fret]) || fret == 0 {
                            noteImage = UIUtility.circleImageWithText(text: SettingsHelper.thirdString[fret], font: font, circleColor: UIColor.blackColor())
                        }
                    }
                    if string == 5{
                        if SettingsHelper.notesToDisplay.contains(SettingsHelper.secondString[fret]) || fret == 0 {
                            noteImage = UIUtility.circleImageWithText(text: SettingsHelper.secondString[fret], font: font, circleColor: UIColor.blackColor())
                        }
                    }
                    if string == 6{
                        if SettingsHelper.notesToDisplay.contains(SettingsHelper.firstString[fret]) || fret == 0 {
                            noteImage = UIUtility.circleImageWithText(text: SettingsHelper.firstString[fret], font: font, circleColor: UIColor.blackColor())
                        }
                    }
                    
                    
                    //height changes based on fret position
                    let testRect = CGRectMake(rect.width*CGFloat(Double(string)+0.1)/8, rect.height*CGFloat(Double(fret)+0.2)/26, rect.width*0.8/8, rect.height*0.6/26)
                    //flip the image upside-down and drawInRect
                    UIGraphicsPushContext(context!)
                    noteImage.drawInRect(testRect)
                    UIGraphicsPopContext()
                }
                
                //Change dimensions to account for landscape view
                if UIDevice.currentDevice().orientation == .LandscapeLeft || UIDevice.currentDevice().orientation == .LandscapeRight{
                    //use this transparent default image if the note should not be displayed
                    var noteImage = UIUtility.circleImageWithText(text: "", font: font, circleColor: UIColor.blackColor().colorWithAlphaComponent(0.0))
                    //draw fret numbers with clear background color
                    if string == 0{
                        if fret != 0 {
                            noteImage = UIUtility.circleImageWithText(text: String(fret), font: font, circleColor: UIColor.clearColor())
                        }
                    }
                    //draw notes on strings if they are contained in [notesToDisplay] or if 0th fret
                    if string == 1{
                        if SettingsHelper.notesToDisplay.contains(SettingsHelper.sixthString[fret]) || fret == 0 {
                            noteImage = UIUtility.circleImageWithText(text: SettingsHelper.sixthString[fret], font: font, circleColor: UIColor.redColor())
                        }
                    }
                    if string == 2{
                        if SettingsHelper.notesToDisplay.contains(SettingsHelper.fifthString[fret]) || fret == 0 {
                            noteImage = UIUtility.circleImageWithText(text: SettingsHelper.fifthString[fret], font: font, circleColor: UIColor.blackColor())
                        }
                    }
                    if string == 3{
                        if SettingsHelper.notesToDisplay.contains(SettingsHelper.fourthString[fret]) || fret == 0 {
                            noteImage = UIUtility.circleImageWithText(text: SettingsHelper.fourthString[fret], font: font, circleColor: UIColor.blackColor())
                        }
                    }
                    if string == 4{
                        if SettingsHelper.notesToDisplay.contains(SettingsHelper.thirdString[fret]) || fret == 0 {
                            noteImage = UIUtility.circleImageWithText(text: SettingsHelper.thirdString[fret], font: font, circleColor: UIColor.blackColor())
                        }
                    }
                    if string == 5{
                        if SettingsHelper.notesToDisplay.contains(SettingsHelper.secondString[fret]) || fret == 0 {
                            noteImage = UIUtility.circleImageWithText(text: SettingsHelper.secondString[fret], font: font, circleColor: UIColor.blackColor())
                        }
                    }
                    if string == 6{
                        if SettingsHelper.notesToDisplay.contains(SettingsHelper.firstString[fret]) || fret == 0 {
                            noteImage = UIUtility.circleImageWithText(text: SettingsHelper.firstString[fret], font: font, circleColor: UIColor.blackColor())
                        }
                    }
                    
                    
                    //height changes based on fret position
                    let testRect = CGRectMake(rect.width*CGFloat(Double(string)+0.1)/8, rect.height*CGFloat(Double(fret)+0.2)/26, rect.width*0.8/8, rect.height*0.6/26)
                    //flip the image upside-down and drawInRect
                    UIGraphicsPushContext(context!)
                    noteImage.drawInRect(testRect)
                    UIGraphicsPopContext()
                }
                
            }
            
        }
        /***** DRAW NOTE ICONS FINISHED *****/
        
        
    }
    
    
    
}

