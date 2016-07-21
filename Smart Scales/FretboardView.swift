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
        
        let circleimage = UIUtility.circleImageWithText(text: "A#", font: font, circleColor: UIColor.blackColor())
        
        let testRect = CGRectMake(rect.width*1.1/8, rect.height*3.2/26, rect.width*0.8/8, rect.height*0.6/26)
        //flip image upside-down
        //CGContextTranslateCTM(context, 0, rect.height);
        //CGContextScaleCTM(context, 1.0, -1.0);
        
        CGContextDrawImage(context, testRect, circleimage.CGImage)
 
        
        
        
    }
    

}




//alternate way to draw note icons
/*
 //draw note icons
 UIGraphicsBeginImageContextWithOptions(CGSize(width: 100, height: 200), false, 0)
 
 let paragraphStyle = NSMutableParagraphStyle()
 paragraphStyle.alignment = .Center
 
 let attributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: 36)!, NSForegroundColorAttributeName: UIColor.greenColor()]
 
 let string = "ACB" as NSString
 // Get the width and height that the text will occupy.
 let stringSize = string.sizeWithAttributes(attributes)
 
 // Center a rect inside of the image
 // by going half the difference to the right and down.
 string.drawInRect(
 CGRectMake(
 (100 - stringSize.width) / 2,
 (200 - stringSize.height) / 2,
 stringSize.width,
 stringSize.height
 ),
 withAttributes: attributes
 )
 
 let newImage = UIGraphicsGetImageFromCurrentImageContext()
 
 UIGraphicsEndImageContext()
 */
