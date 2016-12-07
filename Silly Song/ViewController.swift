//
//  ViewController.swift
//  Silly Song
//
//  Created by andrew gierke on 12/6/16.
//  Copyright © 2016 Androoo. All rights reserved.
//

import UIKit

//MARK: - Variables
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

//MARK: - silly song class
class ViewController: UIViewController {
    
    
    // MARK:- outlets
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lyricsView.text = ""
        nameField.delegate = self
    }
    
    //MARK: - Interactions
    
    @IBAction func reset(_ sender: AnyObject) {
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func displayLyrics(_ sender: AnyObject) {
        
        // make sure name field text property isn't empty
        if (nameField.text != nil) {
            var fullName = nameField.text
            
            // takes name and generate the lyrics
            fullName = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
            
            // display them in the lyricsView outlet
            lyricsView.text = fullName
        } else {
            return
        }
        
    } // closes displayLyrics method
    

} // closes class


// MARK: - lyrics functions




// a function that takes a name and a template

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortenedName(name: fullName)
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}

// shorten name function

func shortenedName(name: String) -> String {
    var shortName = name
    // take off the first two characters of the full name
    
    shortName.characters.removeFirst()
    shortName.lowercased()
    return shortName
}


// MARK: - extensions

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}















































