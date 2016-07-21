//
//  UIUtility.swift
//  Smart Scales
//
//  Created by Jon Lee on 7/20/16.
//  Copyright © 2016 Jon Lee. All rights reserved.
//

import Foundation
import UIKit

struct UIUtility {
    
    static func imageWithColor(color: UIColor, circular : Bool) -> UIImage {
        let size : CGFloat = circular ? 100 : 1;  //?
        let rect = CGRectMake(0.0, 0.0, size, size) //???
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        if(circular) {
            CGContextFillEllipseInRect(context, rect)
        }
        else {
            CGContextFillRect(context, rect)
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    static func drawText(text: NSString, font: UIFont, image: UIImage, point: CGPoint, textColor: UIColor = UIColor.whiteColor()) -> UIImage {
        UIGraphicsBeginImageContext(image.size)
        image.drawInRect(CGRectMake(0, 0, image.size.width, image.size.height))
        let rect = CGRectMake(point.x, point.y, image.size.width, image.size.height)
        text.drawInRect(CGRectIntegral(rect), withAttributes: [ NSFontAttributeName: font, NSForegroundColorAttributeName : textColor ])
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    static func circleImageWithText(text text: String, font: UIFont, circleColor: UIColor, textColor: UIColor = UIColor.whiteColor()) -> UIImage {
        let image = UIUtility.imageWithColor(circleColor, circular: true)
        let textSize = NSString(string: text).sizeWithAttributes([ NSFontAttributeName: font])
        let centerX = (image.size.width / 2.0) - (textSize.width / 2.0)
        let centerY = (image.size.height / 2.0) - (textSize.height / 2.0)
        let middlePoint = CGPointMake(centerX, centerY)
        return UIUtility.drawText(text, font: font, image: image, point: middlePoint)
    }
}