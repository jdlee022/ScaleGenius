//
//  FretboardView.swift
//  Smart Scales
//
//  Created by Jon Lee on 7/18/16.
//  Copyright © 2016 Jon Lee. All rights reserved.
//

import UIKit

/****** THIS CLASS IS USED TO DRAW THE FRETBOARD WITH CORE GRAPHICS IN HomeViewController ******/
@IBDesignable class FretboardView: UIView, OrientationDelegate {
    
    var currentOrientation = "portrait"
    var stringDisplayed = "set in nested for loop"
    
    //these are the colors displayed for the corresponding highlighted interval
    let intervalColor = [UIColor(red: 140/255, green: 38/255, blue: 170/255, alpha: 1), UIColor(red: 50/255, green: 80/255, blue: 205/255, alpha: 1), UIColor(red: 50/255, green: 123/255, blue: 142/255, alpha: 1), UIColor(red: 60/255, green: 205/255, blue: 115/255, alpha: 1), UIColor(red: 234/255, green: 188/255, blue: 0/255, alpha: 1), UIColor(red: 220/255, green: 143/255, blue: 91/255, alpha: 1), UIColor(red: 201/255, green: 80/255, blue: 115/255, alpha: 1)]
    
    //redraw the view whenever the orientation is changed
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setNeedsDisplay()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let context = UIGraphicsGetCurrentContext()
        
        //set background color
        CGContextSetFillColorWithColor(context, UIColor(red: 7/255, green: 16/255, blue: 58/255, alpha: 1).CGColor)
        CGContextFillRect(context, rect)
        CGContextFillEllipseInRect(context, rect)
        
        //draw fretboard rectangle
        let fretboardRect = CGRectMake(rect.width/8,rect.height/26,rect.width*6/8, rect.height*25/26)
        CGContextSetFillColorWithColor(context, UIColor(red: 231/255, green: 226/255, blue: 197/255, alpha: 1).CGColor)
        CGContextAddRect(context, fretboardRect)
        CGContextFillRect(context, fretboardRect)
        CGContextStrokePath(context)
        
        //draw aboveNut rectangle
        let aboveNutRect = CGRectMake(rect.width/8,0,rect.width*6/8, rect.height/26)
        CGContextSetFillColorWithColor(context, UIColor(red: 175/255, green: 121/255, blue: 75/255, alpha: 1).CGColor)
        CGContextAddRect(context, aboveNutRect)
        CGContextFillRect(context, aboveNutRect)
        CGContextStrokePath(context)
        
        
        //set pen color to black
        CGContextSetLineWidth(context, 7.0)
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        
        //draw top line (nut of fretboard)
        CGContextMoveToPoint(context, rect.width/8, rect.height/25)
        CGContextAddLineToPoint(context, rect.width*7/8, rect.height/25)
        CGContextStrokePath(context)
        
        //draw 24 frets
        CGContextSetLineWidth(context, 4)
        CGContextSetStrokeColorWithColor(context, UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1).CGColor)
        for fretNum in 2...25 {
            CGContextMoveToPoint(context, rect.width*1/8, rect.height*CGFloat(fretNum)/25)
            CGContextAddLineToPoint(context, rect.width*7/8, rect.height*CGFloat(fretNum)/25)
            CGContextStrokePath(context)
        }
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        
        //draw 6 strings
        for stringNum in 1...6 {
            CGContextSetLineWidth(context, CGFloat(Double((6-stringNum))/2 + 3))
            CGContextMoveToPoint(context, rect.width*CGFloat(Double(stringNum)+0.5)/8, rect.height/25)
            CGContextAddLineToPoint(context, rect.width*CGFloat(Double(stringNum)+0.5)/8, rect.height*25/25)
            CGContextStrokePath(context)
        }


        
        
        
        /***** DRAW NOTE ICONS *****/
        let font: UIFont = UIFont(name: "Helvetica-Bold", size: 46)!
        
        for string in 0...6{
            for fret in 0...24 {
                
                //use this transparent default image if the note should not be displayed
                var noteImage = UIUtility.circleImageWithText(text: "", font: font, circleColor: UIColor.blackColor().colorWithAlphaComponent(0.0))
                
                //draw fret numbers with clear background color
                if string == 0{
                    if fret != 0 {
                        noteImage = UIUtility.circleImageWithText(text: String(fret), font: font, circleColor: UIColor.clearColor())
                    }
                }
                
                //draw notes on strings if they are contained in [notesToDisplay] or if fret == 0
                if string == 1{
                    //draw the text for the string above the nut regardless of notesToDisplay contents
                    if fret == 0 {
                        noteImage = UIUtility.circleImageWithText(text: SettingsHelper.sixthString[fret], font: font, circleColor: UIColor.clearColor())

                    }
                    //if the note at current string&fret is in notesToDisplay then set noteImage
                    if tupleContainsString(SettingsHelper.notesToDisplay, note: SettingsHelper.sixthString[fret]) {
                        //draw note or interval number depending on switch in Settings
                        if SettingsHelper.intervalState == "On" {
                            //get the interval number as a string
                            stringDisplayed = getIntervalNum(SettingsHelper.sixthString[fret], tupleArr: SettingsHelper.notesToDisplay)
                        }
                        //use the note letter
                        else {
                            stringDisplayed = SettingsHelper.sixthString[fret]
                        }
                        
                        noteImage = UIUtility.circleImageWithText(text: stringDisplayed, font: font, circleColor: getColorForNote(SettingsHelper.sixthString[fret], tupleArr: SettingsHelper.notesToDisplay))
                    }
                }
                if string == 2{
                    if fret == 0 {
                        noteImage = UIUtility.circleImageWithText(text: SettingsHelper.fifthString[fret], font: font, circleColor: UIColor.clearColor())
                        
                    }
                    if tupleContainsString(SettingsHelper.notesToDisplay, note: SettingsHelper.fifthString[fret]) {
                        if SettingsHelper.intervalState == "On" {
                            stringDisplayed = getIntervalNum(SettingsHelper.fifthString[fret], tupleArr: SettingsHelper.notesToDisplay)
                        }
                        else {
                            stringDisplayed = SettingsHelper.fifthString[fret]
                        }
                        
                        noteImage = UIUtility.circleImageWithText(text: stringDisplayed, font: font, circleColor: getColorForNote(SettingsHelper.fifthString[fret], tupleArr: SettingsHelper.notesToDisplay))
                    }
                }
                if string == 3{
                    if fret == 0 {
                        noteImage = UIUtility.circleImageWithText(text: SettingsHelper.fourthString[fret], font: font, circleColor: UIColor.clearColor())
                        
                    }
                    if tupleContainsString(SettingsHelper.notesToDisplay, note: SettingsHelper.fourthString[fret]) {
                        if SettingsHelper.intervalState == "On" {
                            stringDisplayed = getIntervalNum(SettingsHelper.fourthString[fret], tupleArr: SettingsHelper.notesToDisplay)
                        }
                        else {
                            stringDisplayed = SettingsHelper.fourthString[fret]
                        }
                        
                        noteImage = UIUtility.circleImageWithText(text: stringDisplayed, font: font, circleColor: getColorForNote(SettingsHelper.fourthString[fret], tupleArr: SettingsHelper.notesToDisplay))
                    }
                }
                if string == 4{
                    if fret == 0 {
                        noteImage = UIUtility.circleImageWithText(text: SettingsHelper.thirdString[fret], font: font, circleColor: UIColor.clearColor())
                        
                    }
                    if tupleContainsString(SettingsHelper.notesToDisplay, note: SettingsHelper.thirdString[fret]) {
                        if SettingsHelper.intervalState == "On" {
                            stringDisplayed = getIntervalNum(SettingsHelper.thirdString[fret], tupleArr: SettingsHelper.notesToDisplay)
                        }
                        else {
                            stringDisplayed = SettingsHelper.thirdString[fret]
                        }
                        
                        noteImage = UIUtility.circleImageWithText(text: stringDisplayed, font: font, circleColor: getColorForNote(SettingsHelper.thirdString[fret], tupleArr: SettingsHelper.notesToDisplay))
                    }
                }
                if string == 5{
                    if fret == 0 {
                        noteImage = UIUtility.circleImageWithText(text: SettingsHelper.secondString[fret], font: font, circleColor: UIColor.clearColor())
                        
                    }
                    if tupleContainsString(SettingsHelper.notesToDisplay, note: SettingsHelper.secondString[fret]) {
                        if SettingsHelper.intervalState == "On" {
                            stringDisplayed = getIntervalNum(SettingsHelper.secondString[fret], tupleArr: SettingsHelper.notesToDisplay)
                        }
                        else {
                            stringDisplayed = SettingsHelper.secondString[fret]
                        }
                        
                        noteImage = UIUtility.circleImageWithText(text: stringDisplayed, font: font, circleColor: getColorForNote(SettingsHelper.secondString[fret], tupleArr: SettingsHelper.notesToDisplay))
                    }
                }
                if string == 6{
                    if fret == 0 {
                        noteImage = UIUtility.circleImageWithText(text: SettingsHelper.firstString[fret], font: font, circleColor: UIColor.clearColor())
                        
                    }
                    if tupleContainsString(SettingsHelper.notesToDisplay, note: SettingsHelper.firstString[fret]) {
                        if SettingsHelper.intervalState == "On" {
                            stringDisplayed = getIntervalNum(SettingsHelper.firstString[fret], tupleArr: SettingsHelper.notesToDisplay)
                        }
                        else {
                            stringDisplayed = SettingsHelper.firstString[fret]
                        }
                        
                        noteImage = UIUtility.circleImageWithText(text: stringDisplayed, font: font, circleColor: getColorForNote(SettingsHelper.firstString[fret], tupleArr: SettingsHelper.notesToDisplay))
                    }
                }
                
                
                
                /**** Create rect to fill with noteImage and rotate depending on device orientation ****/
                if (currentOrientation == "landscapeleft") {
                    CGContextSaveGState(context);
                    
                    let halfWidth = CGFloat(rect.width*0.8/8 / 2.0)
                    let halfHeight = CGFloat(rect.height*0.6/25 / 2.0)
                    let center = CGPointMake(rect.width*CGFloat(Double(string)+0.1)/8 + halfWidth, rect.height*CGFloat(Double(fret)+0.2)/25 + halfHeight)
                    
                    // Move to the center of the rectangle:
                    CGContextTranslateCTM(context, center.x, center.y)
                    // Rotate:
                    CGContextRotateCTM(context, 1.5708)
                    // Draw the rectangle centered about the center:
                    let rect = CGRectMake(-halfWidth, -halfHeight, rect.width*0.8/8, rect.height*0.6/25)
                    CGContextAddRect(context, rect)
                    noteImage.drawInRect(rect)
                    CGContextRestoreGState(context)
                    
                }
                if ( currentOrientation == "landscaperight") {
                    CGContextSaveGState(context);
                    
                    let halfWidth = CGFloat(rect.width*0.8/8 / 2.0)
                    let halfHeight = CGFloat(rect.height*0.6/25 / 2.0)
                    let center = CGPointMake(rect.width*CGFloat(Double(string)+0.1)/8 + halfWidth, rect.height*CGFloat(Double(fret)+0.2)/25 + halfHeight)
                    
                    // Move to the center of the rectangle:
                    CGContextTranslateCTM(context, center.x, center.y)
                    // Rotate:
                    CGContextRotateCTM(context, 1.5708*3)
                    // Draw the rectangle centered about the center:
                    let rect = CGRectMake(-halfWidth, -halfHeight, rect.width*0.8/8, rect.height*0.6/25)
                    CGContextAddRect(context, rect)
                    noteImage.drawInRect(rect)
                    CGContextRestoreGState(context)
                    
                }
                if (currentOrientation == "portrait") {
                    //height changes based on fret position
                    let testRect = CGRectMake(rect.width*CGFloat(Double(string)+0.1)/8, rect.height*CGFloat(Double(fret)+0.2)/25, rect.width*0.8/8, rect.height*0.6/25)
                    //flip the image upside-down and drawInRect
                    UIGraphicsPushContext(context!)
                    noteImage.drawInRect(testRect)
                    UIGraphicsPopContext()
                    
                }
                
                
            } //end fret for loop
            
        } //end string for loop
        
    } // end drawRect(rect: CGRect)
    
    
    
    //sets a string variable depending on device orientation
    func orientationChanged() {
        
        if(UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeLeft )
        {
            currentOrientation = "landscapeleft"
            self.setNeedsDisplay()
        }
        if (UIDevice.currentDevice().orientation == UIDeviceOrientation.LandscapeRight) {
            currentOrientation = "landscaperight"
            self.setNeedsDisplay()
        }
        
        if(UIDeviceOrientationIsPortrait(UIDevice.currentDevice().orientation))
        {
            currentOrientation = "portrait"
            self.setNeedsDisplay()
        }
    }
    
    //check if a tuple array contains a tuple with a given String
    func tupleContainsString(a:[(String, Int)], note:String) -> Bool {
        
        for (v1, _) in a { if v1 == note { return true } }
        
        return false
    }

    //get the color for a note depending on CheckedRows aka the highlighted intervals
    func getColorForNote(note: String, tupleArr: [(String, Int)]) -> UIColor {
        var colorNum = 0
        
        for (abc, interval) in tupleArr {
            if abc == note && SettingsHelper.CheckedRows.contains(interval) {
                colorNum = interval
                return intervalColor[colorNum]
            }
        }
        return UIColor.blackColor()
    }
    
    //this function is used to get the interval number of a note as a string value 
    func getIntervalNum(note: String, tupleArr: [(String, Int)]) -> String {
        var returnedString = "error"
        var newIntervalNum = 0
        
        for (abc, interval) in tupleArr {
            if abc == note {
                //add one to get correct interval num
                newIntervalNum = interval + 1
                returnedString = "\(newIntervalNum)"
                return returnedString
            }
        }
        return returnedString
    }

    
    
}


