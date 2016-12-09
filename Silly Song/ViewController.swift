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

        guard let name = nameField.text else { return }
        
            var fullName = name
            fullName = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
            lyricsView.text = fullName
    }
} // closes class


// MARK: - lyrics functions

// shorten name function

func shortenedName(name: String) -> String {
    let lowercaseName = name.lowercased().folding(options: .diacriticInsensitive, locale: nil)
    let vowelSet = CharacterSet(charactersIn: "AEIOUaeiou")
    
    // find where ther first vowel is using rangeOfCharacter
    // return lowercase name as substring from lowerbound of the new constant firstVowelRange
    if let firstVowelRange = name.rangeOfCharacter(from: vowelSet, options: .caseInsensitive) {
        return lowercaseName.substring(from: firstVowelRange.lowerBound)
    }
    
    // return full name if no vowels
    return lowercaseName
  
}



func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortenedName(name: fullName)
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    return lyrics
}




// MARK: - extensions

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}















































