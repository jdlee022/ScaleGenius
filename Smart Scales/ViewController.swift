//
//  ViewController.swift
//  Smart Scales
//
//  Created by Jon Lee on 7/12/16.
//  Copyright © 2016 Jon Lee. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    let notesArray = ["A", "A#/Bb", "B", "C", "C#/Db", "D", "D#/Eb", "E", "F", "F#/Gb", "G", "G#/Ab"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notesArray.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        let noteLabel = cell.viewWithTag(1) as! UILabel
        noteLabel.text = notesArray[indexPath.row]
        
        return cell
    }


}

