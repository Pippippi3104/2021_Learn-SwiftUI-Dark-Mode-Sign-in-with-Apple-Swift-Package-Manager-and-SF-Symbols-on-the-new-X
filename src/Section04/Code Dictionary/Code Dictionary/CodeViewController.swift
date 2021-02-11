//
//  CodeViewController.swift
//  Code Dictionary
//
//  Created by Satoshi Shimamura Second on 2021/02/11.
//

import UIKit

class CodeViewController: UIViewController {
    
    // init
    @IBOutlet weak var definitionLabel: UILabel!
    var term: String = "I LIKE TO CODE"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // title
        title = term
        
        // definition
        if term == "Boolean" {
            definitionLabel.text = "A type that is true or false."
        }
        if term == "Int" {
            definitionLabel.text = "A type that is whole number. Positive or negative."
        }
        if term == "Double" {
            definitionLabel.text = "A type that is a number with a decimal."
        }
        if term == "String" {
            definitionLabel.text = "A type that is words or text."
        }
        if term == "Array" {
            definitionLabel.text = "A type that is a list of other types."
        }
    }
}
