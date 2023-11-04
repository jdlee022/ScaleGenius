//
//  UIUtility.swift
//  Smart Scales
//
//  Created by Jon Lee on 7/20/16.
//  Copyright © 2016 Jon Lee. All rights reserved.
//

import Foundation
import UIKit

/****** THIS STRUCT IS USED IN FretboardView.swift TO DRAW THE NOTE ICONS ******/
struct UIUtility {

    static func imageWithColor(color: UIColor, circular : Bool) -> UIImage {
        let size : CGFloat = circular ? 100 : 1;
        let rect = CGRectMake(0.0, 0.0, size, size)

        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!

        context.setFillColor(color.cgColor)
        if(circular) {
            context.fillEllipse(in: rect)
        }
        else {
            context.fill(rect)
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()!

        UIGraphicsEndImageContext()
        return image
    }

    static func drawText(
        text: NSString,
        font: UIFont,
        image: UIImage,
        point: CGPoint,
        textColor: UIColor = UIColor.white
    ) -> UIImage {
        UIGraphicsBeginImageContext(image.size)

        image.draw(in: CGRectMake(0, 0, image.size.width, image.size.height))
        let rect = CGRectMake(point.x, point.y, image.size.width, image.size.height)
        text.draw(in: CGRectIntegral(rect), withAttributes: [ NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor : textColor ])
        let newImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()
        return newImage!
    }

    static func circleImageWithText(
        text: String,
        font: UIFont,
        circleColor: UIColor,
        textColor: UIColor = UIColor.white
    ) -> UIImage {
        let image = UIUtility.imageWithColor(color: circleColor, circular: true)
        let textSize = NSString(string: text).size(withAttributes: [ NSAttributedString.Key.font: font])
        let centerX = (image.size.width / 2.0) - (textSize.width / 2.0)
        let centerY = (image.size.height / 2.0) - (textSize.height / 2.0)

        let middlePoint = CGPointMake(centerX, centerY)

        return UIUtility.drawText(text: text as NSString, font: font, image: image, point: middlePoint)
    }
}
