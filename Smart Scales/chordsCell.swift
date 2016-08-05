//
//  chordsCell.swift
//  Smart Scales
//
//  Created by Jon Lee on 8/3/16.
//  Copyright © 2016 Jon Lee. All rights reserved.
//

import UIKit

class chordsCell: UITableViewCell, UITextViewDelegate{

    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //set the contents of textView
        let attributedString = NSMutableAttributedString(string: "For example, if you wanted to write an energetic song that has a happy sound you could use the progression I-III-IV-VI and refer to those columns in the chart for a major key, say G, then we get the chord progression G-Bm-C-Em. Note that the 'm' in the chart means the chord is minor and 'dim' means that the chord is diminished. For a comprehensive chart of guitar chords in standard tuning check out this link! For a guide to diminished chords tap here.", attributes: [NSFontAttributeName:UIFont(
            name: "Helvetica",
            size: 14.0)!] )
        //add a hyperlink 392 characters into the attributedString
        attributedString.addAttribute(NSLinkAttributeName, value: "https://www.spx.org/upload/Guitar/Basic_Guitar_Chords_000.pdf", range: NSRange(location: 392, length:19))
        
        //add a hyperlink 445 characters into the attributedString
        attributedString.addAttribute(NSLinkAttributeName, value: "https://www.guitarlessonworld.com/lessons/diminished-chords/", range: NSRange(location: 445, length:10))

        textView.attributedText = attributedString
 
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //required to let us open the URL with the hyperlinks
    func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool {
        UIApplication.sharedApplication().openURL(URL)
        return false
    }
 

}
