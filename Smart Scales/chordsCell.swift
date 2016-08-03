//
//  chordsCell.swift
//  Smart Scales
//
//  Created by Jon Lee on 8/3/16.
//  Copyright © 2016 Jon Lee. All rights reserved.
//

import UIKit

class chordCell: UITableViewCell, UITextViewDelegate{

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let attributedString = NSMutableAttributedString(string: "Want to learn iOS? You should visit the best source of free iOS tutorials!")
        attributedString.addAttribute(NSLinkAttributeName, value: "https://www.hackingwithswift.com", range: NSRange(location: 19, length: 55))
        
        //textView.attributedText = attributedString
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool {
        UIApplication.sharedApplication().openURL(URL)
        return false
    }

}
