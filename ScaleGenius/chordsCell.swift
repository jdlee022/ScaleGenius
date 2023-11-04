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
        let attributedString = NSMutableAttributedString(string: "For example, if you wanted to write an energetic song that has a happy sound you could use the progression I-III-IV-VI and refer to those columns in the chart for a major key, say G, then we get the chord progression G-Bm-C-Em. Note that the 'm' in the chart means the chord is minor and 'dim' means that the chord is diminished. For a chart of beginner guitar chords in standard tuning check out this link! For a guide to diminished chords tap here.", attributes: [NSAttributedString.Key.font:UIFont(
            name: "Helvetica",
            size: 14.0)!] )
        //add a hyperlink 392 characters into the attributedString
        attributedString.addAttribute(NSAttributedString.Key.link, value: "https://www.spx.org/upload/Guitar/Basic_Guitar_Chords_000.pdf", range: NSRange(location: 387, length:20))

        //add a hyperlink 445 characters into the attributedString
        attributedString.addAttribute(NSAttributedString.Key.link, value: "https://www.guitarlessonworld.com/lessons/diminished-chords/", range: NSRange(location: 440, length:10))

        //add bold font
        let boldFont = UIFont(name: "Helvetica-Bold", size: 14)
        attributedString.addAttribute(NSAttributedString.Key.font, value: boldFont!, range: NSRange(location: 330, length: 120))

        textView.attributedText = attributedString

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //required to let us open the URL with the hyperlinks
    private func textView(textView: UITextView, shouldInteractWithURL URL: NSURL, inRange characterRange: NSRange) -> Bool {
        UIApplication.shared.open(URL as URL)
        return false
    }


}
